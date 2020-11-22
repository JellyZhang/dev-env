# If you come from bash you might have to change your $PATH.
 #export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
#export ZSH="~/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME=powerlevel10k/powerlevel10k


POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(status time user dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vi_mode ssh)
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=5

POWERLEVEL9K_VI_MODE_INSERT_FOREGROUND='black'
POWERLEVEL9K_VI_MODE_INSERT_BACKGROUND='cyan'
POWERLEVEL9K_VI_MODE_NORMAL_FOREGROUND='black'
POWERLEVEL9K_VI_MODE_NORMAL_BACKGROUND='green'

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=0"
plugins=(git
	zsh-syntax-highlighting
    vi-mode
    zsh-autosuggestions
	)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias ra='ranger'
alias tmux='tmux -u'
alias nv='nvim'
alias gw='cd ~/workspace'
alias gd='docker exec -it local /usr/bin/zsh'
alias dc='docker-compose'

bindkey -M vicmd "j" vi-backward-char
bindkey -M vicmd "i" up-history
bindkey -M vicmd "k" down-history
bindkey -M vicmd "a" vi-insert
bindkey -M vicmd "A" vi-add-next
#bindkey -M vicmd "yy" vi-yank-whole-line
bindkey -M vicmd "L" vi-end-of-line
bindkey -M vicmd "J" vi-beginning-of-line

# tmux
export TERM=xterm-256color
POWERLEVEL9K_IGNORE_TERM_COLORS=true

export GOPATH=/root/go
export PATH=$GOPATH/bin:$PATH
export GOBIN=$GOPATH/bin

KEYTIMEOUT=1

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh
source ~/.p10k.zsh
