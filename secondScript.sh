# second script

# after script runs successfully:
# log out and log back in to machine
# do prefix + capital I inside a tmux session

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

mkdir -p ~/.config
cd ~/.config
mkdir -p nvim
cd nvim
mkdir -p autoload
cd autoload
curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o plug.vim
cd ~/.config/nvim
cp ~/dotfiles/Win10_WSL_init.vim ./
mv Win10_WSL_init.vim init.vim

cp ~/dotfiles/Win10_WSL_zshrc.txt ~/.
mv ~/Win10_WSL_zshrc.txt ~/.zshrc

cp ~/dotfiles/coc-settings.json ~/.config/nvim/.

mkdir -p ~/.config/nvim/plug-config
cp ~/dotfiles/fzf.vim ~/dotfiles/coc.vim ~/.config/nvim/plug-config

vim "+e hello.cpp" "+PlugInstall" "+CocInstall coc-go coc-pyright coc-eslint coc-tsserver coc-css coc-html coc-clangd" "+q!"

# have the pluginstall thing twice cuz without it, the other commands dont run for some reason
vim "+e hello.cpp" "+PlugInstall" "+CocCommand clangd.install" "+q!"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cp ~/dotfiles/tmux.conf ~/.tmux.conf

source ~/.zshrc

chsh -s $(which zsh)

cd ~/dotfiles

