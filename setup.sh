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
	elif [ "$(echo $(uname -s) | cut -c 1-5)" == 'Linux' ]; then
		sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
	fi
fi

if [ "$(echo $(uname -s) | cut -c 1-5)" == 'Linux' ]; then
	brew install patchelf
fi

brew install \
	gcc \
	ncurses \
	openssl \
	zsh \
	git \
	tig \
	hub \
	vim \
	tmux \
	tmux-xpanes \
	tmuxinator \
	direnv \
	anyenv \
	fzf \
	az \
	jq \
	git-secrets \
	tflint

brew tap "rhysd/git-brws" "https://github.com/rhysd/git-brws"
brew install git-brws

if [ "$(uname)" == 'Darwin' ]; then
	brew install
		https://raw.githubusercontent.com/Homebrew/homebrew-core/64555220bfbf4a25598523c2e4d3a232560eaad7/Formula/openssl.rb \
		findutils \
		gnu-sed \
		reattach-to-user-namespace
fi

if [ "$(uname)" == 'Darwin' ] && [ ! -e ~/.oh-my-zsh ] ; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
	git clone git@github.com:zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
	chsh -s $(which zsh)
fi

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
mkdir -p ~/.vim/directory
mkdir -p ~/.vim/backupdir
mkdir -p ~/.vim/undodir

if [ ! -e $(anyenv root)/plugins/anyenv-tfenv-init ] ; then
	mkdir -p $(anyenv root)/plugins
	git clone https://github.com/rugamaga/anyenv-tfenv-init.git $(anyenv root)/plugins/anyenv-tfenv-init
fi

if [ ! -e $(anyenv root)/plugins/anyenv-update ] ; then
	mkdir -p $(anyenv root)/plugins
	git clone https://github.com/znz/anyenv-update.git $(anyenv root)/plugins/anyenv-update
fi

if [ "$(uname)" == 'Darwin' ] && [ ! -e ../../altercation/solarized ] ; then
	mkdir -p ../../altercation
	git clone git@github.com:altercation/solarized.git ../../altercation/
fi

ln -s -f $PWD/.gitconfig $HOME/.gitconfig
ln -s -f $PWD/.gitignore_global $HOME/.gitignore_global
ln -s -f $PWD/.tigrc $HOME/.tigrc
ln -s -f $PWD/.direnvrc $HOME/.direnvrc
ln -s -f $PWD/.tmux.conf $HOME/.tmux.conf
ln -s -f $PWD/.vimrc $HOME/.vimrc
ln -s -f $PWD/.zshrc $HOME/.zshrc
ln -s -f $PWD/.zshenv $HOME/.zshenv
