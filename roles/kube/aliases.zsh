## kubernetes aliases
function kon {
  save_aliases=$(alias -L)
  source $ZSH/roles/kube/kubectl_aliases
  source <(kubectl completion zsh)
}

function koff {
  unalias -m '*'
  eval ${save_aliases}
  unset save_aliases
}

alias kns='kubens'
alias kcx='kubectx'

# Minikube
alias miks='minikube start'