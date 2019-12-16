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

	fh() {
		eval $(fc -l 1 | fzf -e +s --tac | sed 's/ *[0-9]* *//')
	}

	fd() {
	    while true; do
	        local lsd=$(echo ".." && ls -p | grep '/$' | sed 's;/$;;')
	        local dir="$(printf '%s\n' "${lsd[@]}" | fzf -e)"
	        [[ ${#dir} != 0 ]] || return 0
	        cd "$dir" &> /dev/null
	    done
	}

	fb() {
		git branch | fzf --no-sort +m --query "$LBUFFER" --prompt="Branch > "| gsed -e "s/\* //g" | awk "{print $1}" | xargs git checkout
	}

	bind -x '"\C-h": fh'
	bind -x '"\C-]": fd'
	bind -x '"\C-b": fb'
fi

alias lssh=lssh
alias v=vim
alias vi=vim
alias g=git
