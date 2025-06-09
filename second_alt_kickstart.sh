# second script if you intend to use init.lua from kickstart nvim instead of your vimscript config

# after script runs successfully:
# log out and log back in to machine
# do prefix + capital I inside a tmux session

git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting

brew install neovim fastfetch ripgrep unzip tldr copyq bat fzf yarn alacritty ghostty

tldr -u

# https://github.com/nvim-lua/kickstart.nvim --> refer to this repo
git clone https://github.com/srirams1003/lua-nvim-config.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim

git clone https://github.com/srirams1003/i3-dotfiles.git "${XDG_CONFIG_HOME:-$HOME/.config}"/i3

ln -sf ~/.config/i3/.p10k.zsh ~/.p10k.zsh
ln -sf ~/.config/i3/.zshrc ~/.zshrc
ln -sf ~/.config/i3/.alacritty.toml ~/.alacritty.toml
ln -sf ~/.config/i3/ghostty-config ~/Library/Application\ Support/com.mitchellh.ghostty/config

git config --global user.email "sriram.suresh449@gmail.com"
git config --global user.name "Sriram Suresh"

git config --global credential.helper store  'cache --timeout=3000000'

sudo npm i -g pyright
sudo npm install -g diagnostic-languageserver
sudo npm install -g typescript-language-server typescript
sudo npm i -g vscode-langservers-extracted  # for html
sudo npm i -g css-variables-language-server # for css

# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# # ruby stuff
# # this would also mean that you need to install ruby first. idk how to do that for ubuntu
# # is chruby even a thing for ubuntu??

brew install ruby-install chruby
ruby-install --latest ruby
gem install ruby-lsp
gem install colorls


git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -sf ~/.config/i3/.tmux.conf ~/.tmux.conf

source ~/.zshrc

chsh -s $(which zsh)

cd ~/dotfiles

