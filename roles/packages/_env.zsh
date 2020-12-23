# Config remaps
mkdir -p "${XDG_CONFIG_HOME}"/{less,irb,curl,gdb,wget,screen,readline,less}
mkdir -p "${XDG_CACHE_HOME}"/{less,pg,gem,npm,wget,screen,readline}
export WGETRC=${XDG_CONFIG_HOME}/wget/wgetrc
export SCREENRC=${XDG_CONFIG_HOME}/screen/screenrc
export PSQL_HISTORY=${XDG_CACHE_HOME}/pg/psql_history
export CURL_HOME=${XDG_CONFIG_HOME}/curl/curlrc
export INPUTRC=${XDG_CONFIG_HOME}/readline/inputrc
export IRBRC=${XDG_CONFIG_HOME}/irb/irbrc
export GEM_HOME=${XDG_DATA_HOME}/gem
export GEM_SPEC_CACHE=${XDG_CACHE_HOME}/gem
export TERMINFO=${XDG_DATA_HOME}/terminfo
export TERMINFO_DIRS=${XDG_DATA_HOME}/terminfo:/usr/share/terminfo
export LESSKEY=${XDG_CONFIG_HOME}/less/lesskey
export LESSHISTFILE=${XDG_CACHE_HOME}/less/history
export GDB_INIT=${XDG_CONFIG_HOME}/gdb/gdbinit