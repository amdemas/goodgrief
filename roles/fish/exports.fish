umask 0022

# LANG
set -g LANGUAGE "en_US.UTF-8"
set -g LANG "$LANGUAGE"
set -g LC_ALL "$LANGUAGE"

# Z https://github.com/jethrokuan/z
export _Z_DATA="$XDG_DATA_HOME/z"
export _Z_CMD=j

# Enable coloring
set -g CLICOLOR 1
set -g MANROFFOPT -c
#set -g MANPAGER "sh -c 'col -bx | bat -plman'"
set -Ux MANPAGER 'nvim +Man!'
set -g LESS_TERMCAP_md "$yellow" # Highlight section titles in manual pages.

# Setup projects directory for pj https://github.com/oh-my-fish/plugin-pj
set -gx PROJECT_PATHS $HOME/Projects

# AutoLS https://github.com/kpbaks/autols.fish
set -Ux _autols_toggle_status

# FZF https://giithub.com/patrickf1/fzf.fish
fzf_configure_bindings --directory=\cf --variables=\cv

# Theme
fish_config theme choose "Rosé Pine Moon"
