+++

title = "Why NixOS?"
date = "2024-08-24"
slug = "why-nixos"

[taxonomies]
  tags = ["nixos"]

+++

A bit over 2 months ago I started playing with NixOS, a Linux distro based on the Nix package manager. Since then, I've been working on my config piece by piece and migrated both of my personal computers over to NixOS.

But why?

This post covers a very general overview of the Nix ecosystem, and why I use it, and why it isn't for everyone.

Nix is an ecosystem composed of four parts:

- Nix, the language
- Nix, the package manager
- NixOS, the operating system
- Nixpkgs, the package repository

I recommend having a look at the NixOS wiki on the [Nix Ecosystem](https://wiki.nixos.org/wiki/Nix_ecosystem) and Fireship's recent [video on Nix](https://www.youtube.com/watch?v=FJVFXsNzYZQ), but here's a quick summary

### Nix, the package manager

Nix (the package manager) is a purely functional manager that offers completely reproducible builds and package management, allowing a build environment to be replicated on any Linux or Darwin machine, without containers. Nix also supports multi version installs, using the nix store, and easy and complete rollbacks.

### NixOS, the operating system

NixOS is a Linux distribution built around the Nix package manager. NixOS applies Nix's declarative and reproducible nature system wide. This enables users to declaratively configure every aspect of their machines through the use of modules, rather than imperatively through commands.

### Nixpkgs, the package repository

Nixpkgs is the largest community maintained Nix Package and NixOS Module repository. Hosted at [github:NixOS/nixpkgs](https://github.com/NixOS/nixpkgs), it is the largest package repository, boasting the greatest size and freshness.

## The learning curve

NixOS has, in my opinion, an extremely steep learning curve:

- NixOS is fundamentally very different form other Linux distributions, and because of this, there is both a lot to learn, and issues that come up will be difficult to research.
- NixOS will push you to do things the "correct" way, hacky workarounds and pasting commands from the internet wont work, it at least, go against the point of using the OS. An example of this being it's inability to run most binaries built for other distros.
- NixOS uses the Nix language, which at first may look like a variation of a data serialisation language like JSON or YAML, however nix is a powerful functional language with syntax that feels very foreign, at least to anything I have used before.

NixOS provides a lot of benefits in a professional setting, reproducible systems with reproducible build environments removes the "but it works on my machine" issue. It's also great for servers, enabling orchestrating a vast quantity of machines through configuration files, without a web of third party tools that attempt to manage an imperative system declaratively.

But I don't ***need*** any of that, so, why?

## So, why?

A bit about my use case:
- I have two personal computers, a desktop and a laptop, that I use for personal and work use, these both require desktop environments.
- Because my systems are general purpose, they need to be flexible for a variety of workloads and a number of different applications.
- I have used other Linux distributions in the past, with about a year of experience having Linux as my main OS, but have been using Windows as my main operating system.

NixOS may not seem make much sense for my use case, a home Linux desktop is a large disconnect from a lot of the benefits NixOS provides. But surprisingly, a lot of the benefits NixOS provides do apply to a personal computer:

### Ctrl Z

Having used a rolling release distro before, it is not enjoyable having your primary machine, that you depend on for work, be bricked by a package update. NixOS provides the Nix package manager's rollback functionality to the system level, allowing users to step back through each of the builds of their configuration. This allows me to use the unstable branch of nixpkgs, without worry of being down a computer half way through the week.

### System maintenance

A topic I plan to elaborate on in a future post - my systems are ephemeral and all state is opt-in. Any changes made outside of [my NixOS configuration](https://github.com/different-name/nix-files) are removed the moment I reboot. This ensures my systems do not "drift" from the reproducible configuration from any accidental imperative changes. This is a lot like performing a fresh install each reboot, except I keep ***only*** the files and configuration I want, system wide, all defined by my config.

### Never again

In an imperative system it's good to keep a log, or maybe a cheat sheet, of all the important commands you run when configuring a system, be it setting up users, or workarounds for bugs. On NixOS, rather than documenting these commands, you describe your users, your workarounds, inside your configuration file, and never have to apply them again. It's all in your config to stay, on every machine you need it on.

### A project

For me, my NixOS configuration is a passion project, something I enjoy working on. Though NixOS has a lot of management overhead compared to other distributions, I've really enjoyed learning through tinkering. This for me has removed a lot of the pains associated with learning and using NixOS.

Overall, I don't recommend everyone try pick up NixOS, not unless you can't go without a declarative reproducible system. But for those who are looking for a new hobby, I can highly recommend giving it a go.

## What's next?

I plan to write more blog posts soon about more specific concepts regarding NixOS and my configuration, as well as the issues that I face. I'm still only starting out, but if you have any questions about this post, [my configuration](https://github.com/different-name/nix-files), or NixOS in general, feel free to [contact me](@/about.md).
