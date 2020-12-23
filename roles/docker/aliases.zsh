# alias dce='docker container exec -it $(dcls | peco --prompt "[exec /bin/bash]" | cut -d'"'"' '"'"' -f 1) /bin/bash'
# alias dcea='docker container exec -it $(dcls | peco --prompt "[exec /bin/ash]" | cut -d'"'"' '"'"' -f 1) /bin/ash'
# alias dcl='docker container logs $(dcla | peco --prompt "[logs]" | cut -d'"'"' '"'"' -f 1)'
# alias dclf='docker container logs -f $(dcls | peco --prompt "[logs]" | cut -d'"'"' '"'"' -f 1)'
# alias dcla='docker container ls -a'
# alias dcls='docker container ls'
# alias dcp='docker container prune'
# alias dcrm='docker container rm $(dcla | grep "Exited" | peco --prompt "[rm]" | cut -d'"'"' '"'"' -f 1)'
# alias dcs='docker container stop $(dcls | peco --prompt "[stop]" | cut -d'"'"' '"'"' -f 1)'
# alias dils='docker image ls'
# alias dip='docker image prune'
# alias dirm='docker image rm $(dils | peco --prompt "[rm]" | awk '"'"'{ print $3 }'"'"')'
# alias dnls='docker network ls'
# alias dnp='docker network prune'
# alias dvls='docker volume ls'
# alias dvp='docker volume prune'


## kubernetes aliases
function kon {
  save_aliases=$(alias -L)
  source ~/.zsh/lib/.kubectl_aliases
  #source <(kubectl completion zsh)
}

function koff {
  unalias -m '*'
  eval ${save_aliases}
  unset save_aliases
}

alias kns='kubens'
alias kcx='kubectx'
