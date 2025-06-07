#!/bin/bash

# Update system
sudo pacman -Syu --noconfirm

# Install packages
sudo pacman -S --noconfirm zsh nodejs npm vim tmux xsel curl wget git

# Install `n` and use it to install latest stable Node.js
sudo npm install -g n
sudo n stable

# Install global npm packages
sudo npm install -g prettier markdown-it

# Install Oh My Zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

