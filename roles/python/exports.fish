# ipython
set -g IPYTHONDIR "$XDG_CONFIG_HOME/jupyter"
set -g JUPYTER_CONFIG_DIR "$XDG_CONFIG_HOME/jupyter"
# pyenv
set -gx PYENV_ROOT "$XDG_CONFIG_HOME/pyenv"
# poetry
set -g POETRY_HOME "$XDG_DATA_HOME/poetry"
# pipenv
set -g PIPENV_CACHE_DIR "$XDG_CACHE_HOME/pipenv"
# virtualenv
set -g WORKON_HOME "$XDG_DATA_HOME/virtualenvs"
set -g VIRTUALENVWRAPPER_SCRIPT /usr/bin/virtualenvwrapper.sh
set -g PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV true

# if [ -f /usr/bin/virtualenvwrapper_lazy.sh ]; then
#     source /usr/bin/virtualenvwrapper_lazy.sh
# fi
