# Config remaps
mkdir -p $XDG_CONFIG_HOME/{less,irb,curl,gdb,wget,screen,readline,less}
mkdir -p $XDG_CACHE_HOME/{less,pg,gem,npm,wget,screen,readline}
set -g WGETRC $XDG_CONFIG_HOME/wget/wgetrc
set -g SCREENRC $XDG_CONFIG_HOME/screen/screenrc
set -g PSQL_HISTORY $XDG_CACHE_HOME/pg/psql_history
set -g CURL_HOME $XDG_CONFIG_HOME/curl/curlrc
set -g INPUTRC $XDG_CONFIG_HOME/readline/inputrc
set -g IRBRC $XDG_CONFIG_HOME/irb/irbrc
set -g GEM_HOME $XDG_DATA_HOME/gem
set -g GEM_SPEC_CACHE $XDG_CACHE_HOME/gem
set -g TERMINFO $XDG_DATA_HOME/terminfo
set -g TERMINFO_DIRS $XDG_DATA_HOME/terminfo:/usr/share/terminfo
set -g LESSKEY $XDG_CONFIG_HOME/less/lesskey
set -g LESSHISTFILE $XDG_CACHE_HOME/less/history
set -g GDB_INIT $XDG_CONFIG_HOME/gdb/gdbinit
