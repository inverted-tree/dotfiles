<div align="center">
    <h1>my .dotfiles</h1>
    <p>You found the place where I hide my dotfiles.</p>
</div>

> [!IMPORTANT]
> These files are tailored to my own systems and workflows and I would advise you not to blindly apply my configuration on your system. Rather, peek into single files and see if you find something you like and build it up from there.

# Installation
These dotfiles and configuration scripts are meant as a way to automatically set up my system. All dotfile management is based on [chezmoi](https://www.chezmoi.io/) which will also run the scripts to install all the software that I need. To install this tool, I wrote a [bootstrapping script](bootstrap.sh) which can be run in a shell to kick off the installation procedure. To get from 0 to 60 just yank the following command and paste it into your terminal:

```sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/inverted-tree/dotfiles/refs/heads/main/bootstrap.sh)"
```

> [!CAUTION]
> I try my best to always have this remote repository in a clean and consistent state. However, I do not guarantee such a thing and thus, consider this a warning that some scripts / configuration-files might break (parts of) your system.