# Completion
zstyle ':completion:*' group-name ''
# zstyle ':completion:*:messages' format '%d'
# zstyle ':completion:*:descriptions' format '%d'
zstyle ':completion:*:options' verbose yes
zstyle ':completion:*:values' verbose yes
zstyle ':completion:*:options' prefix-needed yes
# Use cache completion
# apt-get, dpkg (Debian), rpm (RedHat), urpmi (Mandrake), perl -M,
# bogofilter (zsh 4.2.1 >=), fink, mac_apps...
zstyle ':completion:*' use-cache true
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' matcher-list \
    '' \
    'm:{a-z}={A-Z}' \
    'l:|=* r:|[.,_-]=* r:|=* m:{a-z}={A-Z}'
# sudo completions
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
    /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin
zstyle ':completion:*' menu select
zstyle ':completion:*' keep-prefix
zstyle ':completion:*' completer _oldlist _complete _match _ignored \
_approximate _list _history

# zstyle ':completion:*' accept-exact '*(N)'
# # Insert space and slash used by the _expand completer.
# zstyle ':completion:*' add-space true
# # Completion modifiers.
# zstyle ':completion:*' completer \
#          _expand _complete _match _ignored _approximate _oldlist _list _history _prefix
# zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters
# # Ignore case.
# # zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' '+m:{A-Z}={a-z}'
# zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
# # Verbose output for completion listing.
# zstyle ':completion:*' verbose yes
# # All different types of matches displayed separately.
# zstyle ':completion:*' group-name ''
# zstyle ':completion:*:options' description 'yes'
# # Make the completion menu selectable.
# # zstyle ':completion:*:default' menu select=2
# zstyle ':completion:*:*:*:*:*' menu select=1
# # Try to keep a preﬁx containing a tilde or parameter expansion.
# zstyle ':completion:*' keep-prefix
# # Use a completion cache.
# zstyle ':completion:*' use-cache true
# zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR
# # Sudo completion.
# zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin
# # Set the list separator.
# zstyle ':completion:*' list-separator '-->'
# # Use 'cdpath' when the word don't match.
# # zstyle ':completion:*:cd:*' tag-order local-directories path-directories
# zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories
# # Fuzzy matching of completions for when you mistype them
# zstyle ':completion:*:match:*' original only
# zstyle ':completion:*:(approximate|correct):*' max-errors 2 numeric
# # Ignore parent directory.
# zstyle ':completion:*:(cd|mv|cp):*' ignore-parents parent pwd
# # Ignore what's already in the line.
# zstyle ':completion:*:(mv|rm|kill|diff):*' ignore-line yes

# If you end up using a directory as argument, this will remove the trailing slash (usefull in ln)
zstyle ':completion:*' squeeze-slashes true

expand-or-complete-with-dots() {
  # toggle line-wrapping off and back on again
  [[ -n "$terminfo[rmam]" && -n "$terminfo[smam]" ]] && echoti rmam
  print -Pn "%{%F{red}......%f%}"
  [[ -n "$terminfo[rmam]" && -n "$terminfo[smam]" ]] && echoti smam

  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots
