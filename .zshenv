export LANG=ja_JP.UTF-8
export EDITOR=vim

# go env
export GOROOT=`go env GOROOT`
export GOPATH=$HOME
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# nodeenv
export PATH=$HOME/.nodebrew/current/bin:$PATH

# perl
if [ -e $HOME/perl5/perlbrew/etc/bashrc ]; then
    source $HOME/perl5/perlbrew/etc/bashrc
fi

# ruby
if [ -d ${HOME}/.rbenv  ] ; then
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi

# php env
export PATH=$HOME/.composer/vendor/bin:$PATH

# docker
export DOCKER_HOST=tcp://

# packer
export PATH=~/packer:$PATH

