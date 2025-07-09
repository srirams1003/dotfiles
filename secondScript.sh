# second script if you intend to use init.lua from kickstart nvim instead of your vimscript config

# after script runs successfully:
# log out and log back in to machine
# do prefix + capital I inside a tmux session

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

# sudo apt install make git-extras gcc wdiff gnome-dictionary ripgrep unzip neovim tldr picom playerctl feh i3 i3status i3blocks alacritty simplescreenrecorder psensor rofi lxappearance arandr copyq bat maim xclip xdotool fzf imagemagick python3-pip fastfetch sl docker.io gimp virtualbox ffmpeg tesseract-ocr dict zenity goldendict guvcview ruby-bundler htop -y

# NOTE: need to install these (or replacements): simplescreenrecoder, maim, xclip, xdotool, psensor, virtualbox

# # NOTE: i commented out these two lines below as I don't wanna use hyprland and thus don't need those extra packages
# sudo dnf copr enable solopasha/hyprland -y
# sudo dnf install make git-extras gcc wdiff ripgrep unzip neovim tldr playerctl alacritty copyq bat fzf ImageMagick python3-pip fastfetch sl docker gimp ffmpeg tesseract dict zenity goldendict guvcview htop blueman hyprland nmtui nm-applet hyprpaper -y --allowerasing

sudo dnf install make git-extras gcc wdiff ripgrep unzip neovim tldr playerctl alacritty copyq bat fzf ImageMagick python3-pip fastfetch sl docker gimp ffmpeg tesseract dict zenity goldendict guvcview htop cmake grim slurp -y --allowerasing

tldr -u

# https://github.com/nvim-lua/kickstart.nvim --> refer to this repo
git clone https://github.com/srirams1003/lua-nvim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

git clone https://github.com/srirams1003/i3-dotfiles.git "${XDG_CONFIG_HOME:-$HOME/.config}"/i3

ln -sf ~/.config/i3/.alacritty.toml ~/.alacritty.toml

ln -sf ~/.config/i3/.p10k.zsh ~/.p10k.zsh
ln -sf ~/.config/i3/.zshrc ~/.zshrc


# # so I can change the notification timeout for dunst to 3 secs from default of 10 secs
# [ -e /etc/xdg/dunst/dunstrc ] && sudo mv /etc/xdg/dunst/dunstrc /etc/xdg/dunst/dunstrc.bak
# sudo ln -sf ~/.config/i3/dunstrc /etc/xdg/dunst/dunstrc


git config --global user.email "sriram.suresh449@gmail.com"
git config --global user.name "Sriram Suresh"

git config --global credential.helper store  'cache --timeout=3000000'
git config --global diff.tool nvimdiff

sudo npm i -g pyright
sudo npm install -g diagnostic-languageserver
sudo npm install -g typescript-language-server typescript
sudo dnf install clang clangd -y
sudo npm i -g vscode-langservers-extracted  # for html
sudo npm i -g css-variables-language-server # for css
sudo dnf -y install golang-go gopls

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# # ruby stuff
# # this would also mean that you need to install ruby first. idk how to do that for ubuntu
# # is chruby even a thing for ubuntu??
sudo dnf install ruby ruby-devel -y
sudo gem install ruby-lsp
sudo gem install colorls
# # made these two changes below to not use sudo anymore cuz i am having to use sudo from bundle install, which is not desirable
# gem install ruby-lsp
# gem install colorls


git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# cp ~/dotfiles/tmux.conf ~/.tmux.conf # no longer using this as I want to add .tmux.conf to git too
ln -sf ~/.config/i3/.tmux.conf ~/.tmux.conf

# # NOTE: need to do the linux equivalent of this, based on where ghostty expects the config file to be on linux
# ln -sf ~/.config/i3/ghostty-config ~/Library/Application\ Support/com.mitchellh.ghostty/config


# # NOTE: this command is to fix a little issue with virtualbox
# sudo usermod -aG vboxusers $USER

source ~/.zshrc

sudo chsh -s $(which zsh)

cd ~/dotfiles

