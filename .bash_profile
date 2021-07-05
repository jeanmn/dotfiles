source ~/.profile
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi

## pyenv-virtualenvwrapper
# https://alysivji.github.io/setting-up-pyenv-virtualenvwrapper.html
#export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
#export WORKON_HOME=$HOME/.virtualenvs
#pyenv virtualenvwrapper_lazy


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

# use newer version of make (default 3.81)  https://stackoverflow.com/a/43446431
export PATH="/usr/local/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '${HOME}/google-cloud-sdk/path.bash.inc' ]; then . '${HOME}/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '${HOME}/google-cloud-sdk/completion.bash.inc' ]; then . '${HOME}/google-cloud-sdk/completion.bash.inc'; fi
export PATH="/usr/local/opt/ruby/bin:$PATH"
