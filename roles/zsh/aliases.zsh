function peco-ssh {
  local host=$(grep '^Host' ~/.ssh/config | awk '{ print $2 }' | peco --prompt '[ssh]')
  if [ -n "${host}" ]; then
    echo "ssh ${host}"
    \ssh ${host}
  fi
}

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias history='history -i'
alias h='history'
alias lv='LC_ALL=ja_JP.UTF-8 lv -c'
alias mkdir='mkdir -p'
alias pk='anyframe-widget-kill'
alias pssh='peco-ssh'
alias reboot='sudo reboot'
alias scp='scp -p'
alias sort='LC_ALL=C sort'
alias sudo='nocorrect sudo '
alias uniq='LC_ALL=C uniq'
autoload -Uz zmv
alias zmv='noglob zmv -W'
alias p="pj "
alias cdots="cd ${ZSH}"
alias n=$HOME/Notes
alias -g A='| awk'
alias -g G='| grep'
alias -g H='| head'
alias -g L='| lv'
alias -g S='| sed'
alias -g T='| tail'
alias -g W='| wc'
alias -g X='| xargs'
type jq >& /dev/null && alias -g J='| jq'
# type pv >& /dev/null && alias -g P='| pv'
type rg >& /dev/null && alias -g R='| rg'
#type xsel >& /dev/null && alias -g X='| xsel -bi'
type yq >& /dev/null && alias -g Y='| yq'


alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias la='ls -aFhl --color'
alias ll='ls -Fhl --color'
alias ls='ls --color'
alias make="make -j$(nproc)"

type xdg-open >& /dev/null && alias open='xdg-open'
type xsel >& /dev/null && alias pbcopy='xsel -bi' \
                        && alias pbpaste='xsel -bo'


type sway >& /dev/null && alias sway='XKB_DEFAULT_OPTIONS=ctrl:nocaps sway'

alias nvidia-settings="nvidia-settings --config=${XDG_CONFIG_HOME}/nvidia/settings"

alias -s zip=zipinfo
alias -s {tgz,gz}=gzcat
alias -s {tbz,bz2}=bzcat
alias -s {md,txt}=vim
alias -s {csv,json,xml,yaml,yml}=vim

# Search aliases
alias as='alias | grep '
