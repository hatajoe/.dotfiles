setopt no_global_rcs

export LC_ALL="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export EDITOR=vim

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin

if [ `uname` = "Darwin" ]; then
	if [ -d $HOME/.anyenv ] ; then
		export PATH="$HOME/.anyenv/bin:$PATH"
		eval "$(anyenv init - zsh)"
	fi
elif [ `expr substr $(uname -s) 1 5` = "Linux" ]; then
	export PATH=/home/linuxbrew/.linuxbrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
	eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
	if [ -d $HOME/.anyenv ] ; then
		export PATH="/home/linuxbrew/.linuxbrew/Cellar/anyenv/1.1.1/bin/:$PATH"
		eval "$(anyenv init - zsh)"
	fi
fi

export GOPATH=$HOME/go
export GO111MODULE=auto

export PATH=$GOPATH/bin:$PATH
if [ "$(uname)" == 'Darwin' ]; then
	export PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
	export PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
fi

export AWS_PROFILE=saml

eval "$(direnv hook zsh)"
eval "$(hub alias -s)"

if [ -e $HOME/.env.secret ] ; then
    source $HOME/.env.secret
fi

export FZF_DEFAULT_OPTS='--height 40% --reverse'
