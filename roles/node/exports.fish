set -g NPM_CONFIG_USERCONFIG "$XDG_CONFIG_HOME/npm/npmrc"
set -g NODE_REPL_HISTORY ''
set -g NVM_DIR "$XDG_CONFIG_HOME/.config/nvm"
set -g JOBS max # tell npm to install concurrently
#group_lazy_load $NVM_DIR/nvm.sh nvm node npm npx yarn
