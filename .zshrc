# ---  SHELL  ---
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# ---  PYENV & VIRTUALENVWRAPPER  ---

#https://github.com/romkatv/powerlevel10k/issues/730#issuecomment-689465943
POWERLEVEL9K_VIRTUALENV_SHOW_WITH_PYENV=if-different

eval "$(pyenv init -)"
# https://alysivji.github.io/setting-up-pyenv-virtualenvwrapper.html
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
#pyenv virtualenvwrapper
pyenv virtualenvwrapper_lazy


# ---  GOOGLE CLOUD SDK  ---

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jeanmn/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/jeanmn/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jeanmn/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/jeanmn/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

alias grep="grep --color"

# https://www.jenv.be/
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
