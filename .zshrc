# Path to your oh-my-zsh installation.
export ZSH=${HOME}/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="robbyrussell"
# ZSH_THEME="ys"
PROMPT='%{$terminfo[bold]$fg[white]%}%* %%%{$reset_color%} '

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(z fzf terraform)

# User configuration
# export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

fpath=(~/.zsh_completions $fpath)
autoload -U compinit && compinit

function exists { which $1 &> /dev/null }

if exists fzf; then
	function lssh() {
		IP=$(lsec2 $@ | fzf -e | awk -F "\t" '{print $2}')
		if [ $? -eq 0 -a "${IP}" != "" ]; then
			echo ">>> SSH to ${IP}"
			ssh ${IP}
		fi
	}

	function select-directory() {
		local res=$(z | sort -rn | cut -c 12- | fzf -e --inline-info)
		if [ -n "$res" ]; then
			BUFFER+="cd $res"
			zle accept-line
		else
			return 1
		fi
	}

	function select-branch() {
		# git branch | fzf --no-sort +m --query "$LBUFFER" --prompt="Branch > " --info=hidden | gsed -e "s/\* //g" | awk "{print $1}" | xargs git checkout
		if [ `expr substr $(uname -s) 1 5` = "Linux" ]; then
			git branch | fzf --no-sort +m | sed -e "s/\* //g" | awk "{print $1}" | xargs git checkout
		else
			git branch | fzf --no-sort +m | gsed -e "s/\* //g" | awk "{print $1}" | xargs git checkout
		fi
            	zle accept-line
	}

	zle -N select-directory
	bindkey '^]' select-directory
	zle -N select-branch
	bindkey '^\' select-branch
fi

if exists saml2aws; then
	function awslogin() {
		saml2aws login --skip-prompt -a "$1" && export AWS_PROFILE="$1"
	}

	function awsconsole() {
		awslogin "$1" && export AWS_PROFILE="$1" && saml2aws console -a "$1"
	}
fi

unsetopt BEEP
alias v=vim
alias vi=vim
alias g=git
alias k=kubectl
alias tf=terraform
