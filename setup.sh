#!/bin/bash

# install brew

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

brew install zsh
brew install git
brew install tig
brew install hub
brew install vim
brew install tmux
brew install anyenv
brew install fzf
curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

ln -s -f $PWD/.gitconfig $HOME/.gitconfig
ln -s -f $PWD/.gitignore_global $HOME/.gitignore_global
ln -s -f $PWD/.tigrc $HOME/.tigrc
ln -s -f $PWD/.tmux.conf $HOME/.tmux.conf
ln -s -f $PWD/.vimrc $HOME/.vimrc
ln -s -f $PWD/.zshenv $HOME/.zshenv
ln -s -f $PWD/.zshrc $HOME/.zshrc
