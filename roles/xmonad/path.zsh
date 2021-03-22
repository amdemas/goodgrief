export PATH=${HOME}/.config/dotfiles/roles/xmonad/files/scripts/:${PATH}

# Fedora is messy when installing xmobar and xmonad
if [[ $(lsb_release -is) == "Fedora" ]]; then
    export PATH=${PATH}:${HOME}/.cabal/bin/
fi