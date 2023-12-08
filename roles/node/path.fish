# HACK: This is to get coc.nvim working (which relies on vim-node-rpc)
# Without this, the node bin/ directory
# won't always be in $PATH 
set -gx PATH ~/.config/nvm/versions/ $PATH
set -gx PATH ~/.config/nvm/versions/node/v13.12.0/bin $PATH
