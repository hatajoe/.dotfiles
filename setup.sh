#!/bin/bash

brew -v &> /dev/null
if [ $? -ne 0 ] ; then
	if [ "$(uname)" == 'Darwin' ]; then
		ruby -v &> /dev/null
		if [ $? -ne 0 ] ; then
			echo 'install ruby before running setup.sh required'
			exit 1
		fi
		/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
	fi
fi

brew install \
	git \
	tig \
	hub \
	vim \
	tmux \
	tmuxinator \
	direnv \
	anyenv \
	fzf \
	gnu-sed \
	az \
	jq \
	kubectl \
	kubectx \
	helm

ln -s -f $PWD/.gitconfig $HOME/.gitconfig
ln -s -f $PWD/.gitignore_global $HOME/.gitignore_global
ln -s -f $PWD/.tigrc $HOME/.tigrc
ln -s -f $PWD/.direnvrc $HOME/.direnvrc
ln -s -f $PWD/.tmux.conf $HOME/.tmux.conf
ln -s -f $PWD/.vimrc $HOME/.vimrc
ln -s -f $PWD/.bash_profile $HOME/.bash_profile
ln -s -f $PWD/.bashrc $HOME/.bashrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.vim/directory
mkdir -p ~/.vim/backupdir
mkdir -p ~/.vim/undodir

if [ "$(uname)" == 'Darwin' ] || [ ! -e ../../altercation/solarized ] ; then
	mkdir ../../altercation/solarized
	git clone git@github.com:altercation/solarized.git ../../altercation/solarized
fi
