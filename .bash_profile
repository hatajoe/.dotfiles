if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

# encode
export LANG=ja_JP.UTF-8

if [ -e $HOME/perl5/perlbrew/etc/bashrc ]; then
    source $HOME/perl5/perlbrew/etc/bashrc
fi

# docker
export DOCKER_HOST=tcp://

# packer
export PATH=~/packer:$PATH

# php env
export PATH=$HOME/.composer/vendor/bin:$PATH

# rbenv
if [ -e /usr/local/bin/rbenv ]; then
    eval "$(rbenv init -)"
fi

# go env
export GOPATH=$HOME/dev/go-workspace
export PATH=$GOPATH/bin:$PATH

# nodeenv
export PATH=$HOME/.nodebrew/current/bin:$PATH

alias tmux="TERM=xterm-256color tmux"
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim -u $HOME/.vimrc "$@"'
alias vi=vim
# alias weechat-curses='env PYTHONPATH=/usr/local/lib/python3.3/site-packages weechat-curses'
alias vgs='vagrant global-status -a'

# git settings
source $HOME/.git-prompt.sh
source $HOME/.git-completion.bash
GIT_PS1_SHOWDIRTYSTATE=true
export PS1='\[\033[1;32m\]\u@\h\[\033[00m\]:\[\033[1;34m\]\w\[\033[1;31m\]$(__git_ps1)\[\033[00m\]\$ '

