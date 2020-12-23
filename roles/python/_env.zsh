# ipython
export IPYTHONDIR="$XDG_CONFIG_HOME"/jupyter
export JUPYTER_CONFIG_DIR="$XDG_CONFIG_HOME"/jupyter
# pyenv
export PYENV_ROOT="$XDG_CONFIG_HOME/pyenv"
# poetry
export POETRY_HOME="$XDG_DATA_HOME/poetry"
# pipenv
export PIPENV_CACHE_DIR="$XDG_CACHE_HOME/pipenv"
# virtualenv
export WORKON_HOME="$XDG_DATA_HOME"/virtualenvs
export VIRTUALENVWRAPPER_SCRIPT=/usr/bin/virtualenvwrapper.sh
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"

if [ -f /usr/bin/virtualenvwrapper_lazy.sh ]; then
    source /usr/bin/virtualenvwrapper_lazy.sh
fi