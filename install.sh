#!/bin/sh

rm ~/.tmux.conf
rm ~/.zshrc
rm ~/.vimrc
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.vimrc ~/.vimrc
