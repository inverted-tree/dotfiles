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
fi

