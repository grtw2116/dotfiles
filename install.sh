#!/bin/bash

FILE="~/.config/nvim/init.vim"
if [ ! -f $FILE ]; then
	mkdir -p ~/.config/nvim
	ln -s ~/dotfiles/init.vim ~/.config/nvim
fi

FILE="~/.latexmkrc"
if [ ! -f $FILE ]; then
	ln -s ~/dotfiles/.latexmkrc ~/.latexmkrc
fi
