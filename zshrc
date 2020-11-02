#!/usr/bin/env zsh
# source: https://github.com/jxlil/dotfiles

export ZSH=$HOME/.dotfiles/oh-my-zsh
ZSH_CUSTOM=$HOME/.dotfiles/custom-oh-my-zsh

# add local bin
export PATH="$HOME/.local/bin/":$PATH

# theme
# ZSH_THEME="finox"
ZSH_THEME="fishy"

# plugins
plugins=(git extract gen-ssh)

source $ZSH/oh-my-zsh.sh

# alias
alias dotfiles="cd ~/.dotfiles"
alias vimrc="nvim ~/.vim/vimrc"
alias zshrc="nvim ~/.zshrc"
alias cp="cp -r"
alias v="nvim"


# functions
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

