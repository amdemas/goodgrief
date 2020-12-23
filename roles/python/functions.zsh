# Remove python compiled byte-code in either current directory or in a
# list of specified directories
function pyclean() {
    ZSH_PYCLEAN_PLACES=${*:-'.'}
    find ${ZSH_PYCLEAN_PLACES} -type f -name "*.py[co]" -delete
    find ${ZSH_PYCLEAN_PLACES} -type d -name "__pycache__" -delete
}

function build-readme() {
    if [[ -e README.html ]]; then
        rm README.html
    fi
    rst2html.py README.rst > README.html
    open README.html
}

# Build docs in watch mode.
# requires sphinx-autobuild (pip install sphinx-autobuild)
function sphinxwatch() {
    sphinx-autobuild --open-browser docs docs/_build
}


# Clear all ipdb statements
function rmpdb() {
    git ls-files -oc --exclude-standard "*.py" | cat | xargs sed -i '' '/import ipdb;/d'
    echo "Cleared breakpoints"
}

# Generate fake data, e.g. `fake name`, `fake url`, `fake email`
# Requires faker to be installed (pip install faker)
function fake() {
    result=$(PYTHONIOENCODING=UTF-8 faker -s="" $1)
    echo "$result"
    echo "$result" | pbcopy
}

# Lazy load pyenv
if type pyenv > /dev/null; then
    export PATH="${PYENV_ROOT}/bin:${PYENV_ROOT}/shims:${PATH}"
    function pyenv() {
        unset -f pyenv
        eval "$(command pyenv init -)"
        eval "$(command pyenv virtualenv-init -)"
        pyenv $@
    }
fi