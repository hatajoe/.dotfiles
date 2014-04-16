#!/bin/sh

rm ~/.tmux.conf
rm ~/.zshrc
rm ~/.vimrc
rm -rf ~/.weechat
rm -rf ~/.composer
rm -rf ~/.git_template
rm ~/.tigrc
rm ~/.gitconfig
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.weechat ~/.weechat
ln -s ~/.dotfiles/.composer ~/.composer
ln -s ~/.dotfiles/.git_template ~/.git_template
ln -s ~/.dotfiles/.tigrc ~/.tigrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig

