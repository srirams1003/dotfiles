#!/bin/bash

# Clone Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions "$ZSH_CUSTOM/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"

# Install system packages via pacman
sudo pacman -Syu --noconfirm
sudo pacman -S --noconfirm \
  make git gcc wdiff ripgrep unzip neovim tldr picom playerctl feh \
  alacritty psensor bat man \
  rofi lxappearance arandr copyq maim xclip xdotool fzf \
  imagemagick python-pip docker gimp virtualbox ffmpeg \
  tesseract tesseract-data-eng zenity guvcview ruby htop sl
# sudo pacman -S --noconfirm \
#   make git gcc wdiff ripgrep unzip neovim tldr picom playerctl feh \
#   i3-wm i3status i3blocks alacritty psensor bat man\
#   rofi lxappearance arandr copyq bat maim xclip xdotool fzf \
#   imagemagick python-pip docker gimp virtualbox ffmpeg \
#   tesseract tesseract-data-eng zenity guvcview ruby htop sl
  
# NOTE: need to find an alternative for simplescreenrecorder

# Update tldr pages
tldr -u

# Clone dotfiles/config
git clone https://github.com/srirams1003/lua-nvim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}/nvim"
git clone https://github.com/srirams1003/i3-dotfiles.git "${XDG_CONFIG_HOME:-$HOME/.config}/i3"

# Symlinks
ln -sf ~/.config/i3/.alacritty.toml ~/.alacritty.toml
ln -sf ~/.config/i3/.p10k.zsh ~/.p10k.zsh
ln -sf ~/.config/i3/.zshrc ~/.zshrc
ln -sf ~/.config/i3/.tmux.conf ~/.tmux.conf
# Optional (based on your notes)
# ln -sf ~/.config/i3/.xinitrc ~/.xinitrc
# ln -sf ~/.config/i3/.Xresources ~/.Xresources
# mkdir -p ~/.config/rofi
# ln -sf ~/.config/i3/config.rasi ~/.config/rofi/config.rasi

# System-wide config backup and replace
# [ -e /etc/environment ] && sudo mv /etc/environment /etc/environment.bak
# sudo ln -sf ~/.config/i3/etc-environment /etc/environment
# [ -e /etc/X11/Xresources/x11-common ] && sudo mv /etc/X11/Xresources/x11-common /etc/X11/Xresources/x11-common.bak
# sudo ln -sf ~/.config/i3/etc-X11-Xresources-x11-common /etc/X11/Xresources/x11-common
# [ -e /etc/xdg/dunst/dunstrc ] && sudo mv /etc/xdg/dunst/dunstrc /etc/xdg/dunst/dunstrc.bak
# sudo ln -sf ~/.config/i3/dunstrc /etc/xdg/dunst/dunstrc

# Git config
git config --global user.email "sriram.suresh449@gmail.com"
git config --global user.name "Sriram Suresh"
git config --global credential.helper 'cache --timeout=3000000'
git config --global diff.tool nvimdiff

# NPM LSPs
sudo npm install -g pyright diagnostic-languageserver typescript typescript-language-server
sudo npm install -g vscode-langservers-extracted css-variables-language-server

# Clang (clangd for C/C++ LSP)
sudo pacman -S --noconfirm clang

# Go and gopls
sudo pacman -S --noconfirm go
go install golang.org/x/tools/gopls@latest
# make sure GOPATH/bin is in PATH if using go install

# Powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"

# Ruby gems (installed user-wide, no sudo)
gem install ruby-lsp colorls

# Tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# VirtualBox group permissions
sudo usermod -aG vboxusers "$USER"

# Apply Zsh settings and change shell
source ~/.zshrc
chsh -s "$(which zsh)"

# Go to dotfiles directory
cd ~/dotfiles

