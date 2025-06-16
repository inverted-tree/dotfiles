#!/bin/bash

# This script bootstraps the automation environment

GITHUB_USERNAME="inverted-tree"

if [[ ${OSTYPE//[0-9.]/} == "darwin" ]]; then
	# Install xCode cli tools
	echo "Installing commandline tools..."
	xcode-select --install

	# Install the brew package manager
	if command -v "brew --version" &> /dev/null; then
		echo "Installing Brew..."
		NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
		brew analytics off
		# Add brew to the path
		echo >> /Users/$(USER)/.zprofile
		echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/lukas/.zprofile
		eval "$(/opt/homebrew/bin/brew shellenv)"
	fi

	# Install the dotfile manager
	brew install "chezmoi"

	chezmoi init --apply $GITHUB_USERNAME

elif [[ ${OSTYPE} == "linux-gnu" ]]; then
	# Arch (based) Linux distros are supported
	if command -v pacman --version > /dev/null 2>&1; then
		# Do a full system upgrade before installing any new packages
		sudo pacman -Syuq --noconfirm
		if command -v yay --version > /dev/null 2>&1; then
			echo "Yay, yay is already installed"
		else
			if pacman -Ss "^yay\$" > /dev/null 2>&1; then
				echo "Yay is available via pacman, installing from there"
				sudo pacman -Sq --noconfirm yay
			else
				echo "Installing yay as the AUR helper"
				sudo pacman -S --needed git base-devel
				git clone https://aur.archlinux.org/yay.git
				cd yay
				makepkg -si
			fi
			yay -Yq --noconfirm --gendb
			yay -Syuq --noconfirm --devel
			yay -Yq --noconfirm --devel --save
		fi

		# Install the dotfile manager
		yay -Sq --noconfirm chezmoi

		chezmoi init --apply $GITHUB_USERNAME

	# Nix OS linux is supported
	elif command -v nix --help > /dev/null 2>&1; then
		# Since the nix workflow is a bit different, only the dotfiles are pulled
		chezmoi init --apply $GITHUB_USERNAME

	else
		echo "Can't find the 'pacman' package manager or 'nix' command. This script only works on Arch (based) Linux distributions as well as Nix OS."
		exit 1
	fi

else
	echo "Unsupported OS type '${OSTYPE}'"
	exit 1
fi

