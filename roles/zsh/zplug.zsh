# ----------------------------------------------------
# zplug
# ----------------------------------------------------
# Let zplug manage itself
zplug "zplug/zplug"

# ----------------------------------------------------
# load extra plug files
# ----------------------------------------------------
zplug "$ZSH", from:local, use:"**/plug.zsh"

# ----------------------------------------------------
# install extra binaries
# ----------------------------------------------------
zplug "mroth/evalcache", from:"github"
# zplug "peco/peco", as:command, from:gh-r, use:"*${(L)$(uname -s)}*amd64*"

# ----------------------------------------------------
# zsh-async
# ----------------------------------------------------
# Async for zsh, used by pure
zplug "mafredri/zsh-async", from:"github", use:"async.zsh"

# ----------------------------------------------------
# Syntax Highlighting
# ----------------------------------------------------
# Syntax highlighting for commands, load last
#zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "b4b4r07/zsh-vimode-visual", from:"github"

# ----------------------------------------------------
# History
# ----------------------------------------------------
zplug "zsh-users/zsh-history-substring-search"

# Provide tab completion suggestions
zplug "zsh-users/zsh-autosuggestions", defer:2

# ----------------------------------------------------
# Completions
# ----------------------------------------------------
zplug "zsh-users/zsh-completions", use:"src", lazy:true
zplug "sparsick/ansible-zsh"

# ----------------------------------------------------
# oh-my-zsh plugins/libs
# ----------------------------------------------------
zplug "plugins/history", from:oh-my-zsh
zplug "plugins/dnf", from:oh-my-zsh
zplug "plugins/pj", from:oh-my-zsh
zplug "supercrabtree/k"

# ----------------------------------------------------
# General plugins
# ----------------------------------------------------
# esc to redo command as sudo
zplug "hcgraf/zsh-sudo"
# anyframe
zplug "mollifier/anyframe"
# progress
zplug "Xfennec/progress", as:command, hook-build:'make', rename-to:pg
# enhancd
zplug "b4b4r07/enhancd", use:init.sh
# ctrl z without ohmyzsh
zplug "mdumitru/fancy-ctrl-z"
# tips
#zplug "djui/alias-tips", from:"github"
zplug "agkozak/zsh-z", defer:3

# ----------------------------------------------------
# Theme
# ----------------------------------------------------
#zplug "denysdovhan/spaceship-prompt", use:spaceship.zsh, from:"github", as:"theme"
#zplug "starship/starship", from:gh-r, as:command, rename-to:starship, use:"startship-x86_64-unknown-linux-gnu.tar.gz"
# zplug "starship/starship", from:gh-r, as:command, use:"starship-x86_64-unknown-linux-gnu.tar.gz", at:v1.10.3

# Install plugins if there are plugins that have not been installed
if type "zplug" > /dev/null; then
    if ! zplug check --verbose; then
        printf "Installfdsafdsaf? [y/N]: "
        if read -kq; then
            echo; zplug install
        fi
    fi
fi
