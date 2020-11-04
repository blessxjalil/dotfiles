#!/usr/bin/env zsh
# source: https://github.com/jxlil/dotfiles

export DOTFILES="$HOME/.dotfiles"
export ZSH="$DOTFILES/oh-my-zsh"
export ZSH_CUSTOM="$DOTFILES/custom-oh-my-zsh"

# add local bin
export PATH="$HOME/.local/bin/":$PATH

# theme
# ZSH_THEME="finox"
ZSH_THEME="fishy"

# plugins
plugins=(git extract gen-ssh)

source $ZSH/oh-my-zsh.sh

# alias
alias vimrc="nvim ~/.config/nvim/init.vim"
alias dotfiles="cd ~/.dotfiles"
alias zshrc="nvim ~/.zshrc"
alias cp="cp -r"
alias v="nvim"
alias py="python3.8"


# functions

pi() {
	py -m pip install $1 --upgrade
}


update() {
	sudo apt update -y
	sudo apt dist-upgrade -y
	sudo apt autoremove -y
}

trash() {
    mkdir -p /tmp/wastebasket/
    mv $* /tmp/wastebasket/
}

destroy() {
    shred -vzu -n 10 $*
}

