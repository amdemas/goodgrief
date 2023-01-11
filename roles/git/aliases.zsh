alias ga='git add'
alias gb='git branch'
alias gc='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias gl='git log'
alias glo='git log --oneline'
alias gp='git push'
alias gr='git reset'
alias gs='git status'

if type "zplug" > /dev/null; then
    if ! zplug check mroth/evalcache; then
        alias _evalcache='eval'
    fi
fi

# hub
_evalcache hub alias -s
