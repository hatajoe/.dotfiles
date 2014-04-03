#!/bin/sh

rm ~/.tmux.conf
rm ~/.zshrc
rm ~/.vimrc
rm ~/.weechat
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.vimrc ~/.weechat
