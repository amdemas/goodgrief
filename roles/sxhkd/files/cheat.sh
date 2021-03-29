#!/bin/zsh
cat $XDG_CONFIG_HOME/sxhkd/sxhkdrc \
| awk '/^[a-z]/ && last {print $0,"\t",last} {last=""} /^#/{last=$0}' \
| column -t -s $'\t' | rofi -dmenu -i