#!/bin/bash

NVIM_FILE="~/.config/nvim/init.vim"
if [ ! -f $NVIM_FILE ]; then
	mkdir -p ~/.config/nvim
	ln -s ~/dotfiles/init.vim ~/.config/nvim
fi

LATEXMK_FILE="~/.latexmkrc"
if [ ! -f $LATEXMK_FILE ]; then
	ln -s ~/dotfiles/.latexmkrc ~/.latexmkrc
fi
