
define link_to_home
	@if [ ! -L $(HOME)/$(1) ]; then \
		ln -s ${PWD}/$(1) $(HOME); \
  	fi
endef

define ask_before_install
	@#https://zsh.sourceforge.io/Doc/Release/Shell-Builtin-Commands.html#index-read
	@if read -q "choice? Setup $(1)? (Press Y/y): "; then \
		make $(1); \
	fi
endef



profile:
	$(call link_to_home,.profile)
	$(info setup profile... Done.)

bash: profile
	$(call link_to_home,.bash_profile)
	$(call link_to_home,.bashrc)

zsh: profile
	$(call link_to_home,.zprofile)
	$(call link_to_home,.zshrc)

powerlevel10k: zsh
	brew tap homebrew/cask-fonts
	brew install --cask font-hack-nerd-font
	@# https://github.com/romkatv/powerlevel10k
	brew install romkatv/powerlevel10k/powerlevel10k
	$(call link_to_home,.p10k.zsh)


shell: zsh powerlevel10k

brew:
	@if [[ $$(command -v brew) == "" ]]; then \
		/bin/bash -c "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"; \
		brew update; \
	fi

make: brew
	brew install make:

tmux: brew
	brew install tmux
	$(call link_to_home,.tmux.conf)

vim:
	$(call link_to_home,.vimrc)
	$(call link_to_home,.vim)

ranger:
	@if [ ! -L $(HOME)/.config/ranger ]; then \
		ln -s ${PWD}/.config/ranger ${HOME}/.config; \
	fi

jq: brew
	brew install jq

fzf: brew
	brew install fzf

pyenv: brew
	brew install pyenv
	@#https://github.com/pyenv/pyenv-virtualenvwrapper
	brew install pyenv-virtualenvwrapper

kubectl: brew
	brew install kubectl 

python: pyenv

java: brew
	brew install jenv
	@#https://stackoverflow.com/questions/30602633/maven-ignoring-jenv-settings
	jenv enable-plugin maven



languages: python java

SHELL := /bin/zsh

gcloud: brew
	@# https://formulae.brew.sh/cask/google-cloud-sdk
	brew install --cask google-cloud-sdk

optional:
#	$(if command -v gcloud,,$(call ask_before_install,gcloud))
	$(if "",echo true,echo false)

cmdline-tools: make shell tmux vim ranger jq

common: cmdline-tools languages fzf kubectl

all: common optional
