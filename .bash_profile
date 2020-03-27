export LC_ALL="en_US.UTF-8"
export EDITOR=vim
export SHELL_SESSION_HISTORY=0
export PROMPT_COMMAND="history -a"

export PATH=/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin

export GOPATH=$HOME/go
export GO111MODULE=auto
export PATH=$GOPATH/bin:$PATH

. ~/.bash_profile.secret
. ~/.bashrc
