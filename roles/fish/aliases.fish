function peco-ssh
    set -l host $(grep '^Host' ~/.ssh/config | awk '{ print $2 }' | peco --prompt '[ssh]')
    if $host
        echo "ssh $host"
        ssh $host
    end
end

alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias grep='grep --color=auto'
alias history='history -i'
alias lv='LC_ALL=ja_JP.UTF-8 lv -c'
alias ls='ll'
alias mkdir='mkdir -p'
alias pk='anyframe-widget-kill'
alias pssh='peco-ssh'
alias reboot='sudo reboot'
alias scp='scp -p'
alias sort='LC_ALL=C sort'
#alias sudo='nocorrect sudo '
alias uniq='LC_ALL=C uniq'
alias zmv='noglob zmv -W'
alias p="pj "
alias cdots="cd $FISH_CONFIGS"
alias n=$HOME/Notes
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

alias make="make -j$(nproc)"
#alias -s zip=zipinfo
#alias -s {tgz,gz}=gzcat
#alias -s {tbz,bz2}=bzcat
#alias -s {md,txt}=vim
#alias -s {csv,json,xml,yaml,yml}=vim

# Search aliases
alias as='alias | grep '
