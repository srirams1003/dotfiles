# first script

sudo dnf update -y
sudo dnf install -y curl wget git zsh nodejs npm vim tmux xsel
sudo npm install n -g
sudo n stable
sudo npm install -g prettier markdown-it

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

