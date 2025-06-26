<div align="center">
    <h1>my .dotfiles</h1>
    <p>You found the place where I hide my dotfiles.</p>
</div>

> [!IMPORTANT]
> These config files are tailored to my workflow. The main reason i threw them in a public repository is so I can quickly apply them to any system and have a familiar environment within seconds. Go ahead and break your system, I know you want to.

The [dotfiles](./dot_config/) and [config scripts](./scripts/) are useful to
- get a familiar environment on a new system within secons.
- sync all configurations across existing systems.
- flex my ricing skills.
- waste a lot of time that I should have spent programming something useful.

I manage these files with a tool called [chezmoi](https://www.chezmoi.io/), which also runs scripts for defined conditions.[^1][^2] To bootstrap the setup of a completely new system, there is a [script](./bootstrap.sh) that can be curled into an unsuspecting `bash` shell which sets everyting up.

> [!NOTE]
> For NixOS systems check out my [nix configurations](https://github.com/inverted-tree/nixos-config). First, build the system and then run the bootsrap scirpt afterwards. All scripts are OS/distro aware and run accordingly.

# Bootstrapping a new system
If you are on a fresh Linux/MacOS installation, this is the way to go:
```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/inverted-tree/dotfiles/refs/heads/main/bootstrap.sh)"
```

# Applying the config to an existing system
If you are on an existing system, the first option should not install anything that is already there, but if chezmoi is already installed, to just apply the dotfiles use the following snippet:
```sh
chezmoi init --apply https://github.com/inverted-tree/dotfiles.git --exclude=scripts
```

---

> [!CAUTION]
> No guarantee this will not completely nuke your system, but hey, it works on my machine.

[^1]: Such as installing programs with the OS's native package manager.
[^2]: Am I hiding a logic bomb?
