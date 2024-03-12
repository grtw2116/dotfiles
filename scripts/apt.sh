sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install -y \
	bat \
	build-essential \
	language-pack-ja \
	software-properties-common \
	ripgrep \
	zsh

# Neovimのインストール
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get update
sudo apt-get install -y neovim
