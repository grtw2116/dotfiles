#!/bin/bash

FILE="~/.config/nvim/init.vim"
if [ -f $FILE ]; then
	rm $FILE
else
	mkdir -p ~/.config/nvim
	ln -s ~/dotfiles/init.vim ~/.config/nvim
fi
