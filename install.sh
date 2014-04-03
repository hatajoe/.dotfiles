#!/bin/sh

rm ~/.tmux.conf
rm ~/.zshrc
rm ~/.vimrc
rm ~/.weechat
rm ~/.tigrc
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.weechat ~/.weechat
ln -s ~/.dotfiles/.tigrc ~/.tigrc
