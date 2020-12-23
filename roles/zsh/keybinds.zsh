### Keybind
## -v (-M vicmd) : command mode
## -a (-M viins) : insert mode

# Make sure that the terminal is in application mode when zle is active, since
# only then values from $terminfo are valid
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init() {
    echoti smkx
  }
  function zle-line-finish() {
    echoti rmkx
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

# Bindings.
bindkey -v

# Move to begining and end of line.
bindkey -M vicmd '^A' vi-beginning-of-line
bindkey -M vicmd '^E' vi-end-of-line
bindkey -M viins '^A' vi-beginning-of-line
bindkey -M viins '^E' vi-end-of-line

# Search forward and backward in the history for a specified string.
bindkey -M vicmd '^N' history-beginning-search-forward
bindkey -M vicmd '^P' history-beginning-search-backward
bindkey -M viins '^N' history-beginning-search-forward
bindkey -M viins '^P' history-beginning-search-backward

# Search forward and backward in the history for any part of string.
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# Kill from the cursor to the end of the line.
bindkey -M vicmd '^K' kill-line
bindkey -M viins '^K' kill-line

# Kill from the beginning of the line to the cursor position.
bindkey -M vicmd '^U' backward-kill-line
bindkey -M viins '^U' backward-kill-line

# Delete the current word.
bindkey -M vicmd '^D' delete-word
bindkey -M viins '^D' delete-word

# Enable UNDO and REDO.
bindkey -M vicmd 'u' undo
bindkey -M vicmd '^R' redo

# Don't store register.
bindkey -M vicmd 'x' delete-char

# Enable Fn-Delete key.
bindkey -M viins '^[[3~' delete-char

# Enable Delete key at all times.
bindkey -M viins "^?" backward-delete-char

# Easy escape.
bindkey -M viins 'jj' vi-cmd-mode

# Select menu list by vi-like keybind.
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

# Use commandline stack.
show_buffer_stack() {
  zle vi-end-of-line
  POSTDISPLAY="
stack: $LBUFFER"
  zle push-line-or-edit
}
zle -N show_buffer_stack
bindkey -M vicmd '^Q' show_buffer_stack
bindkey -M viins '^Q' show_buffer_stack

# Use anyframe.
autoload -Uz anyframe-init anyframe-init
zstyle ":anyframe:selector:" use peco

# Smart change directory using cdr.
bindkey -M viins '^S' anyframe-widget-cdr

# Smart history search and execute.
bindkey -M viins '^R' anyframe-widget-execute-history

# Smart history search and put command line.
bindkey -M viins '^F' anyframe-widget-put-history

# Search ghq projects.
bindkey -M viins '^G' anyframe-widget-cd-ghq-repository

# Checkout git branch
bindkey -M viins '^B' anyframe-widget-checkout-git-branch

# auto suggest
bindkey '^ ' autosuggest-accept
bindkey '^~' autosuggest-accept
bindkey '\ew' kill-region                             # [Esc-w] - Kill from the cursor to the mark
bindkey -s '\el' 'ls\n'                               # [Esc-l] - run command: ls
bindkey '^r' history-incremental-search-backward      # [Ctrl-r] - Search backward incrementally for a specified string. The string may begin with ^ to anchor the search to the beginning of the line.
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line      # [Home] - Go to beginning of line
fi
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}"  end-of-line            # [End] - Go to end of line
fi
if [[ "${terminfo[kcbt]}" != "" ]]; then
  bindkey "${terminfo[kcbt]}" reverse-menu-complete   # [Shift-Tab] - move through the completion menu backwards
fi
bindkey '^?' backward-delete-char                     # [Backspace] - delete backward
if [[ "${terminfo[kdch1]}" != "" ]]; then
  bindkey "${terminfo[kdch1]}" delete-char            # [Delete] - delete forward
else
  bindkey "^[[3~" delete-char
  bindkey "^[3;5~" delete-char
  bindkey "\e[3~" delete-char
fi
# Edit the current command line in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey '\C-x\C-e' edit-command-line
