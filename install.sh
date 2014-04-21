#!/bin/sh

rm ~/.bash_profile
rm ~/.tmux.conf
rm -rf ~/.tmux
rm ~/.tmux-powerlinerc
rm ~/.zshrc
rm ~/.vimrc
rm -rf ~/.weechat
rm -rf ~/.composer
rm -rf ~/.git_template
rm ~/.tigrc
rm ~/.gitconfig
rm ~/.git-completion.bash
rm ~/.git-prompt.sh
ln -s ~/.dotfiles/.bash_profile ~/.bash_profile
ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
ln -s ~/.dotfiles/.tmux ~/.tmux
ln -s ~/.dotfiles/.tmux-powerlinerc ~/.tmux-powerlinerc
ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/.weechat ~/.weechat
ln -s ~/.dotfiles/.composer ~/.composer
ln -s ~/.dotfiles/.git_template ~/.git_template
ln -s ~/.dotfiles/.tigrc ~/.tigrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.git-completion.bash ~/.git-completion.bash
ln -s ~/.dotfiles/.git-prompt.sh ~/.git-prompt.sh

