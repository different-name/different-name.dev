+++

title = "declare your steam launch options"
date = "2025-06-20"
slug = "declare-your-steam-launch-options"

[taxonomies]
  tags = ["nixos", "home-manager"]

+++

the steam client allows users to specify "launch options" for each of their games. These can be used to specify environmental variables, arguments, options and even wrapper commands

launch options are typically used to troubleshoot, optimize performance, configure games or enable features, for example I use the following launch options for vrchat:

```shell
env -u TZ PRESSURE_VESSEL_FILESYSTEMS_RW="$XDG_RUNTIME_DIR/wivrn/comp_ipc" %command%
```

these are powerful, however over time you end up with a lot of these launch options you've either set up yourself, or stolen from the internet. either way you're going to forget them, and inevitably have to rediscover how you got "once human" working after you reinstall steam, or move to a different computer

## steam-launch.nix

this is where my shiny new home-manager module steps in! steam-launch.nix is a project that allows you to set steam game launch options right from your nixos configuration

using the vrchat example from earlier, my configuration would look like:

```nix
programs.steam-launch = {
  enable = true;
  
  options = {
    "438100" = ''env -u TZ PRESSURE_VESSEL_FILESYSTEMS_RW="$XDG_RUNTIME_DIR/wivrn/comp_ipc" %command%'';
  };
};
```

here we enabled steam-launch, and specified the launch options for vrchat's app id. you can use tools like [steamdb](https://steamdb.info/app/438100/) to retrieve app ids

and that's it! enjoy your declarative launch options <3

please keep in mind, this is in early development, and is unstable. use with caution! [github:different-name/steam-launch.nix](https://github.com/different-name/steam-launch.nix)

### how it works

steam stores launch options (and a bunch of other data) in a file called `localconfig.vdf`. This file is in valve's [KeyValue](https://developer.valvesoftware.com/wiki/KeyValues) format and can be found in your userdata config folder:

```
$XDG_DATA_HOME/Steam/userdata/<userid>/config/
```

steam-launch.nix converts your launch options configuration into a json file, which is passed on to the `steam-launch-setter` program, a python script that uses the [srctools](https://github.com/TeamSpen210/srctools) library to parse `localconfig.vdf`

`steam-launch-setter` checks the contents of `localconfig.vdf` and only writes changes if needed. this is important, because steam must be closed for any written changes to persist. steam-launch.nix provides the `stopSteam` option, which will automatically stop steam whenever a change must be written
