+++

title = "Erase my darlings? - Impermanence"
date = "2024-08-28"
slug = "erase-my-darlings-impermanence"

[taxonomies]
  tags = ["nixos", "ephemeral"]

+++

Graham Christensen wrote a great blog post in April of 2020 titled "**Erase your darlings**". It covers why he erases his NixOS systems at every boot. I highly recommend reading the [original post](https://grahamc.com/blog/erase-your-darlings/).

Graham covered his use case in a server setting with ephemeral root storage. The concept has since grown, with many opting to extend this to the Linux desktop. Some, including myself, even having the home directory on ephemeral storage.

## Why would you want to wipe your system?

When you first set up a fresh OS, everything feels clean and fresh. As Graham puts it:

> Getting a new computer is this moment of cleanliness. The keycaps don’t have oils on them, the screen is perfect, and the hard drive is fresh and unspoiled

You may feel the need to reinstall your operating system sometimes, either because things are running slow, your system is unstable, or just because everything feels "messy".

A reinstall is usually great at resolving these issues, but we end up nuking everything. Files, applications, configurations, fixes and tweaks. So we need to backup beforehand. However, it's quite a large and scary job to choose what to backup and it's almost impossible to sort through the application state and configuration that has been irrevocably spread through the file system by various applications.

But we don't need to nuke everything to maintain a clean and stable system. Instead we can break up this fairly large task of sorting, backing up and reinstalling and incorporate it into the day to day maintenance and usage of the system:

### Full control

In an ephemeral system, we opt out on keeping all files and directories by default. This flips the model from "What should I delete?" to "What should I keep?". Our system is clean by default and we maintain full control of system clutter.

This lets us:
- Try out new applications without worrying about the files they normally irrevocably distribute across the file system
- Enforce declarative configuration, but enable explicitly allowing imperative changes where needed
  - *Imperative changes are commonly required for desktop applications!*
- Make easy backups! We're essentially maintaining a list of everything we want to keep, which makes optimised backups extremely convenient

By only opting in to keeping files when we want them, we distribute the work of reinstalling across the life of a system, it becomes part of the day to day maintenance, instead of pushing the later down the line. We love front loading!

## How to "opt out"

My setup is very similar to Graham's in his original post.

My disk has a boot partition, a swap partition, and a zpool. The zpool is where our ephemeral setup lives. It's important to have at least 2 datasets here, one will roll back to a blank snapshot at boot, the other will be left alone. These datasets are our ephemeral and persistent storage.

In my case, I created a datasets for `/` `/home` `/nix` and `/persist`.

- `/` and `/home` will be my ephemeral storage.
- `/nix` and `/persist` will be my persistent storage.

`/nix` needs to be ephemeral as this directory is needed for NixOS to build the remainder of the system, NixOS is unique in it's ability to boot with only the `/nix` directory intact.

`/persist` is where we will store all of our persistent files and directories, safe from the purge.

It's worth noting that you could use a tmpfs for the root file system (not including the home directory) and this would work perfectly. You'll need to make sure you have enough ram to spare to store everything though. BTRFS has also been a popular option for this setup, and works just as well.

# Opting back in

I made use of the [Impermanence NixOS modules](https://github.com/nix-community/impermanence) to manage my persistent files, this is essentially a wrapper around bind mounts and symlinks that allows for easy configuration of an ephemeral system.

This made it easy to specify what directories I wanted to persist at the system level:

```nix
{
  environment.persistence."/persist/system" = {
    hideMounts = true;

    directories = [
      "/var/log"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/etc/zfs/keys"
    ];

    files = [];
  };
}
```

As well as at the user level with the Impermanence [home-manager](https://github.com/nix-community/home-manager) module:

```nix
{
  home.persistence."/persist/home/different" = {
    directories = [
      "nix-files"
      ".ssh"
      ".local/share/Trash"
    ];

    files = [
      ".local/share/nix/repl-history"
    ];

    allowOther = true;
  };
}
```

My full configuration is available on GitHub - You can find my system persistence config [here](https://github.com/different-name/nix-files/blob/77263e0d9d8f0f8b8f15831a2b0d40dceab49451/system/common/global/persistence.nix), and my home persistence config [here](https://github.com/different-name/nix-files/blob/77263e0d9d8f0f8b8f15831a2b0d40dceab49451/home/common/global/persistence.nix).

\* Note that I have grouped my persistence config together in relevant configuration files, for example system ssh keys are persisted in the [system openssh config file](https://github.com/different-name/nix-files/blob/77263e0d9d8f0f8b8f15831a2b0d40dceab49451/system/common/global/services/openssh.nix). The files linked above are more generic.

## Quirks

This method of persisting ephemeral files relies on symlinks and bind mounts to "redirect" the desired files to persistent storage. Unfortunately not all applications play nicely with this.

I recommend using bind mounts as they seem to be far more reliable, however I have encountered issues with steam refusing to ***install*** when ~/.steam or ~/.local/share/Steam are either symlinks or bind mounts. Though it ***seems*** to run fine once installed.

If you discover an application that has an issue like this, I recommend creating a new zfs dataset and mounting that to the desired directory instead, this solved the issues I was having with steam thankfully.
