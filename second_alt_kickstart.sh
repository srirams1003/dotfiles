# second script if you intend to use init.lua from kickstart nvim instead of your vimscript config

# after script runs successfully:
# log out and log back in to machine
# do prefix + capital I inside a tmux session

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update -y
sudo apt install make gcc ripgrep unzip neovim tldr picom playerctl feh i3 i3status i3blocks alacritty simplescreenrecorder psensor rofi lxappearance arandr copyq bat maim xclip xdotool fzf imagemagick xautolock -y
tldr -u

# https://github.com/nvim-lua/kickstart.nvim --> refer to this repo
git clone https://github.com/srirams1003/lua-nvim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

git clone https://github.com/srirams1003/i3-dotfiles.git "${XDG_CONFIG_HOME:-$HOME/.config}"/i3

sudo ln -sf ~/.config/i3/i3blocks.conf /etc/i3blocks.conf
sudo ln -sf ~/.config/i3/i3status.conf /etc/i3status.conf # i use i3blocks instead of i3status but adding this too just in case
ln -sf ~/.config/i3/.alacritty.toml ~/.alacritty.toml
mkdir -p ~/.config/rofi
ln -sf ~/.config/i3/config.rasi ~/.config/rofi/config.rasi
# NEED TO MAKE SURE THAT THIS LINE BELOW WORKS. HAVEN'T TESTED IT SO FAR BUT IT SHOULD WORK
[ -e /usr/share/X11/xkb/symbols/pc ] && sudo mv /usr/share/X11/xkb/symbols/pc /usr/share/X11/xkb/symbols/pc.bak
sudo ln -sf ~/.config/i3/usr-share-X11-xkb-symbols-pc /usr/share/X11/xkb/symbols/pc
ln -sf ~/.config/i3/.p10k.zsh ~/.p10k.zsh
ln -sf ~/.config/i3/.zshrc ~/.zshrc

git config --global user.email "sriram.suresh449@gmail.com"
git config --global user.name "Sriram Suresh"

git config --global credential.helper store  'cache --timeout=3000000'

sudo npm i -g pyright
sudo npm install -g diagnostic-languageserver
sudo npm install -g typescript-language-server typescript
sudo apt-get install clangd-12 -y
sudo update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-12 100
sudo npm i -g vscode-langservers-extracted  # for html
sudo npm i -g css-variables-language-server # for css
sudo apt-get -y install golang-go gopls

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# # ruby stuff
# # this would also mean that you need to install ruby first. idk how to do that for ubuntu
# # is chruby even a thing for ubuntu??
sudo apt-get -y install ruby-full
sudo gem install ruby-lsp
sudo gem install colorls

# I am also skipping installing java lsp for now since I don't ever use Java and it seems complicated and why would i lose some seconds in loading a plugin I never even use

# cp ~/dotfiles/Win10_WSL_zshrc.txt ~/.
# mv ~/Win10_WSL_zshrc.txt ~/.zshrc

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# cp ~/dotfiles/tmux.conf ~/.tmux.conf # no longer using this as I want to add .tmux.conf to git too
ln -sf ~/.config/i3/.tmux.conf ~/.tmux.conf

source ~/.zshrc

chsh -s $(which zsh)

cd ~/dotfiles

sudo cpan JSON

lxappearance &

flatpak install --noninteractive flathub hu.irl.cameractrls
