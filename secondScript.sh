# second script if you intend to use init.lua from kickstart nvim instead of your vimscript config

# after script runs successfully:
# log out and log back in to machine
# do prefix + capital I inside a tmux session

sudo apt upgrade -y

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo add-apt-repository ppa:zhangsongcui3371/fastfetch -y
sudo apt update -y
sudo apt install make cmake git-extras gcc wdiff ripgrep unzip neovim tldr bat xclip xdotool fzf imagemagick python3-pip fastfetch sl ffmpeg tesseract-ocr dict ruby-bundler htop mysql-server cowsay valgrind espeak cmatrix git-svn -y
tldr -u

# https://github.com/nvim-lua/kickstart.nvim --> refer to this repo
git clone https://github.com/srirams1003/lua-nvim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

git clone https://github.com/srirams1003/i3-dotfiles.git "${XDG_CONFIG_HOME:-$HOME/.config}"/i3

ln -sf ~/.config/i3/.p10k.zsh ~/.p10k.zsh
ln -sf ~/.config/i3/.zshrc ~/.zshrc

git config --global user.email "sriram.suresh@terralogic.com"
git config --global user.name "Sriram Suresh"

git config --global credential.helper store  'cache --timeout=3000000'
git config --global diff.tool nvimdiff

sudo npm i -g pyright
sudo npm install -g nodemon tree-sitter-cli firebase-tools
sudo npm install -g diagnostic-languageserver
sudo npm install -g typescript-language-server typescript
sudo apt install clang clangd -y
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
# # made these two changes below to not use sudo anymore cuz i am having to use sudo from bundle install, which is not desirable
# gem install ruby-lsp
# gem install colorls

# I am also skipping installing java lsp for now since I don't ever use Java and it seems complicated and why would i lose some seconds in loading a plugin I never even use

# cp ~/dotfiles/Win10_WSL_zshrc.txt ~/.
# mv ~/Win10_WSL_zshrc.txt ~/.zshrc

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# cp ~/dotfiles/tmux.conf ~/.tmux.conf # no longer using this as I want to add .tmux.conf to git too
ln -sf ~/.config/i3/.tmux.conf ~/.tmux.conf

source ~/.zshrc

chsh -s $(which zsh)

cd ~/dotfiles

