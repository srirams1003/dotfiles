# second script if you intend to use init.lua from kickstart nvim instead of your vimscript config

# after script runs successfully:
# log out and log back in to machine
# do prefix + capital I inside a tmux session

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

cp ~/dotfiles/Win10_WSL_zshrc.txt ~/.
mv ~/Win10_WSL_zshrc.txt ~/.zshrc

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cp ~/dotfiles/tmux.conf ~/.tmux.conf

source ~/.zshrc

chsh -s $(which zsh)

cd ~/dotfiles
