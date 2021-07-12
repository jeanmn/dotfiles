#https://formulae.brew.sh/formula/make
export PATH="$(brew --prefix)/opt/make/libexec/gnubin:$PATH"


 #https://github.com/pyenv/pyenv#installation
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"
#eval "$(pyenv init -)"


# http://www.jenv.be/
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"


#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#export LC_ALL=en_US.UTF-8

#tmux on start
if [[ ! $TERM =~ screen ]]; then
#    exec tmux
    tmux new-session -A -s main
fi
