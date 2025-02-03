# first script

sudo pacman -Syu
sudo pacman -S curl wget git zsh nodejs npm vim tmux xsel --noconfirm
sudo npm install n -g
sudo n stable
sudo npm install -g prettier markdown-it

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

