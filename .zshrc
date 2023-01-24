# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.


# User specific aliases and functions
alias home='cd /home/runedominik/'
alias desk='cd /home/runedominik/Desktop'
alias shome='cd ~'
alias ls='ls -A --color=auto'
alias juno="jupyter-notebook --no-browser --port=8889 --ip=0.0.0.0"

alias checkupdates='sudo apt-get update && sudo apt-get upgrade'
alias clean='sudo apt-get autoclean && sudo apt-get autoremove'
alias log='git log --all --decorate --graph'

alias c='xsel -ib'
alias v='xsel -bo'
alias cdv='cd `xsel -bo`'

alias vim='nvim'
alias codium='nvim'
#Autocomplete case insensitive
# If ~./inputrc doesn't exist yet, first include the original /etc/inputrc so we don't override it
#if [ ! -a ~/.inputrc ]; then echo '$include /etc/inputrc' > ~/.inputrc; fi

# Add option to ~/.inputrc to enable case-insensitive tab completion
#echo 'set completion-ignore-case On' >> ~/.inputrc

# autocomplete bei tmux
alias tma='tmux attach -t $1'
if [ -f ~/.tma ]; then
. ~/.tma
fi


alias gitblack='git status -s | grep " M " | cut -f3 -d" " | xargs black'


# latex
export PATH="$HOME/.local/texlive/2021/bin/x86_64-linux:$PATH"

# zplug
source ~/.zplug/init.zsh
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "Jxck/dotfiles", as:command, use:"bin/{histuniq,color}"

zplug "supercrabtree/k"

zplug "agkozak/zsh-z"

zplug "Tarrasch/zsh-command-not-found"

# Load theme file
zplug 'dracula/zsh', as:theme

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
# Then, source plugins and add commands to $PATH
zplug load 

## case-insensitive (all) completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

. $HOME/.local/miniconda3/etc/profile.d/conda.sh
conda activate working

export ZSH_AUTOSUGGEST_STRATEGY=(
    completion
    history
)

eval $(thefuck --alias doh)
eval $(thefuck --alias fuck)
