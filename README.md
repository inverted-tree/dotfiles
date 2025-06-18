<div align="center">
    <h1>my .dotfiles</h1>
    <p>You found the place where I hide my dotfiles.</p>
</div>

> [!IMPORTANT]
> These config files are tailored to my own systems and workflows. As usual I advise against blindly applying someone else's configurations on your system. Rather, peek into single files and see if you find something you like and build something up from there. The main reason these files are in a public repository is such that I can quickly apply them to any new system and have a familiar environment within seconds.

# Installation
These dotfiles and configuration scripts are meant as a way to automatically set up my systems. All dotfile management is based on a tool called [chezmoi](https://www.chezmoi.io/), which will run the scripts to install the software that I need. To bootstrap this process, I wrote a [script](bootstrap.sh) which can be run in a shell to kick off the installation procedure. To get from 0 to 60 just yank the following command and paste it into the terminal:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/inverted-tree/dotfiles/refs/heads/main/bootstrap.sh)"
```

> [!CAUTION]
> I try my best to always have this remote repository in a clean and consistent state. However, I do not guarantee such a thing and thus, consider this a warning that some scripts / configuration-files might break (parts of) your system and or configuration.

