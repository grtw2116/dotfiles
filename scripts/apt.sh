sudo apt update
sudo apt upgrade -y
sudo apt install -y \
    bat \
    build-essential \
    software-properties-common \
    zsh

# Neovimのインストール
sudo add-apt-repository ppa:neovim-ppa/stable
sudo apt update
sudo apt install -y neovim
