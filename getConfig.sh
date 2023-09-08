sudo apt update
sudo apt install zsh nodejs npm vim tmux
sudo apt install curl wget git
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim

mkdir -p ~/.config
cd ~/.config
mkdir autoload
cd autoload
curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o plug.vim
cd ~/.config/nvim
cp ~/dotfiles/Win10_WSL_init.vim ./
mv Win10_WSL_init.vim init.vim

cp ~/dotfiles/Win10_WSL_zshrc.txt ~/.
mv ~/Win10_WSL_zshrc.txt ~/.zshrc

source ~/.zshrc

cp ~/dotfiles/coc-settings.json ~/.config/nvim/.

mkdir ~/.config/nvim/plug-config
cp ~/dotfiles/fzf.vim ~/dotfiles/coc.vim ~/.config/nvim/plug-config

vim "+PlugInstall" "+CocInstall coc-go coc-pyright coc-eslint coc-tsserver coc-css coc-html coc-clangd" "+qall"

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cp ~/dotfiles/tmux.conf ~/.tmux.conf

chsh -s $(which zsh)
