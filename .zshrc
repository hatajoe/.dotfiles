# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
ZSH_THEME="cloud"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(brew git git-flow hub vagrant capistrano heroku zsh_reload)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# go env
export GOROOT=`go env GOROOT`
export GOPATH=$HOME
export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

if [ -e $HOME/perl5/perlbrew/etc/bashrc ]; then
    source $HOME/perl5/perlbrew/etc/bashrc
fi

# docker
export DOCKER_HOST=tcp://

# packer
export PATH=~/packer:$PATH

# php env
export PATH=$HOME/.composer/vendor/bin:$PATH

# nodeenv
export PATH=$HOME/.nodebrew/current/bin:$PATH

# rbenv
if [ -e $HOME/.rbenv ]; then
    eval "$(rbenv init -)"
fi

# encode
export LANG=ja_JP.UTF-8

# editor
export EDITOR=vim

setopt hist_ignore_all_dups

function exists { which $1 &> /dev/null }

if exists peco; then
    function peco_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | peco --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }
    function search-junk-by-peco(){
        DOCUMENT_DIR="\
            $HOME/.vim/tmp/junk"
        BUFFER=$(echo $DOCUMENT_DIR | xargs find | \
            grep -E "\.(txt|php|sql|md)$" | peco)
        if [ $? -eq 0 ]; then
            CURSOR=$#BUFFER
            zle -R -c               # refresh
        fi
    }

    zle -N peco_select_history
    bindkey '^R' peco_select_history

    zle -N search-junk-by-peco
    bindkey '^O' search-junk-by-peco
fi

alias g=git
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vi=vim

