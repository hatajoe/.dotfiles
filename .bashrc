if [ `uname` = "Darwin" ]; then
	if [ -d $HOME/.anyenv ] ; then
		export PATH="$HOME/.anyenv/bin:$PATH"
		eval "$(anyenv init - zsh)"
	fi
        
	. /usr/local//etc/bash_completion.d/git-completion.bash
	. /usr/local//etc/bash_completion.d/kubectl
	. /usr/local//etc/bash_completion.d/helm

elif [ `expr substr $(uname -s) 1 5` = "Linux" ]; then
	export PATH=/home/linuxbrew/.linuxbrew/bin:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin
	eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
	if [ -d $HOME/.anyenv ] ; then
    		export PATH="/home/linuxbrew/.linuxbrew/Cellar/anyenv/1.1.1/bin/:$PATH"
    		eval "$(anyenv init - zsh)"
	fi
fi

eval "$(direnv hook bash)"

exists () {
	type -a $1 > /dev/null 2>&1
}

if exists fzf; then
	lssh() {
		IP=$(lsec2 $@ | fzf -e | awk -F "\t" '{print $2}')
		if [ $? -eq 0 -a "${IP}" != "" ]; then
			echo ">>> SSH to ${IP}"
			ssh ${IP}
		fi
	}
fi

alias v=vim
alias vi=vim

alias g=git
__git_complete g __git_main

alias k=kubectl
complete -F __start_kubectl k
