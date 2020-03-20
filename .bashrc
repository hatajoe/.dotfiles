if [ `uname` = "Darwin" ]; then
	if [ -d $HOME/.anyenv ] ; then
		export PATH="$HOME/.anyenv/bin:$PATH"
		eval "$(anyenv init - zsh)"
	fi
        
	. /usr/local//etc/bash_completion.d/git-completion.bash

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

open-pull-request () {
    merge_commit=$(ruby -e 'print (File.readlines(ARGV[0]) & File.readlines(ARGV[1])).last' <(git rev-list --ancestry-path $1..master) <(git rev-list --first-parent $1..master))
    if git show $merge_commit | grep -q 'pull request'
    then
        pull_request_number=$(git log -1 --format=%B $merge_commit | sed -e 's/^.*#\([0-9]*\).*$/\1/' | head -1)
        url="`hub browse -u`/pull/${pull_request_number}"
    fi
    open $url
}

alias lssh=lssh
alias v=vim
alias vi=vim
alias g=git
