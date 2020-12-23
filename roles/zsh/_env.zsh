umask 0022

# LANG
export LANGUAGE='en_US.UTF-8'
export LANG=${LANGUAGE}
export LC_ALL=${LANGUAGE}

# Z
# export _Z_DATA="$XDG_DATA_HOME/z"
export _Z_CMD=j

# Do not load /etc/profile which overrid $PATH
# Ref: http://karur4n.hatenablog.com/entry/2016/01/18/100000
setopt no_global_rcs

# ignore duplicated path
typeset -U path

# (N-/): do not register if the directory is not exists
#  N: NULL_GLOB option (ignore path if the path does not match the glob)
#  -: follow the symbol links
#  /: ignore files
path=(
  /usr/local/bin(N-/)
  /usr/local/sbin(N-/)
  /usr/bin(N-/)
  /bin(N-/)
  /usr/sbin(N-/)
  /sbin(N-/)
  $path
)

cdpath=(${HOME})

typeset -U manpath
manpath=(
    $HOME/.local/share/man(N-/)
    $manpath
    /usr/local/texlive/texmf-dist/doc/man(N-/)
    /opt/local/share/man(N-/)
    /usr/local/share/man(N-/)
    /usr/share/man(N-/)
)

typeset -xT SUDO_PATH sudo_path
typeset -U sudo_path
sudo_path=(
    $sudo_path
    /opt/local/sbin(N-/)
    /usr/local/sbin(N-/)
    /usr/sbin(N-/)
    /sbin(N-/)
)

typeset -T LD_LIBRARY_PATH ld_library_path; typeset -U ld_library_path
typeset -T LIBRARY_PATH library_path; typeset -U library_path
typeset -T CPATH cpath; typeset -U cpath

# Enable coloring
export CLICOLOR=1
export MANPAGER='less -X'; # Don't clear the screen after quitting a manual page.
export LESS_TERMCAP_md="$yellow" # Highlight section titles in manual pages.

# ls command colors
# export LSCOLORS=exfxcxdxbxegedabagacad
# export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

# Settings for golang
# export GOPATH=${HOME}/.go
# export GOBIN=${GOPATH}/bin
# export PATH=${GOBIN}:${PATH}

#npm
export JOBS=max # tell npm to install concurrently

# Setup projects directory for pj
export PROJECT_PATHS=(${HOME}/Projects)

## command history
export HISTCONTROL=ignoredups
export HISTFILE="$XDG_CACHE_HOME/zsh/history"
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export HISTSIZE=100000
export SAVEHIST=${HISTSIZE}

if [[ $UID == 0 ]]; then
  unset HISTFILE
  export SAVEHIST=0
fi

# Allow async for auto suggestion
export ZSH_AUTOSUGGEST_USE_ASYNC=true

# Desk
[ -n "$DESK_ENV" ] && source "$DESK_ENV" || true

# starship
export STARSHIP_CONFIG=${ZSH}/roles/zsh/files/starship.toml

# evalcache.zsh
export ZSH_EVALCACHE_DIR=${XDG_CACHE_HOME}/evalcache

# z
_Z_DATA=${XDG_CACHE_HOME}/z

# enhancd
export ENHANCD_FILTER=peco
export ENHANCD_DIR=${XDG_DATA_HOME}/enhancd