# first script

sudo apt update -y
sudo apt install zsh nodejs npm vim tmux xsel -y
sudo npm install n -g
sudo n stable
sudo npm install -g prettier markdown-it
sudo apt install curl wget git -y

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

