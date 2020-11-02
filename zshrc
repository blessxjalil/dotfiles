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
plugins=(git extract github-ssh)

source $ZSH/oh-my-zsh.sh

# alias
alias zshrc="vim ~/.zshrc"
alias vimrc="vim ~/.vim/vimrc"
alias dotfiles="cd ~/.dotfiles"
alias v="vim"

alias cp="cp -r"

# functions
update() {
	sudo apt update -y
	sudo apt dist-upgrade -y
	sudo apt autoremove -y
	echo "Updated! 🍻"
}

trash() {
    mkdir -p /tmp/wastebasket/
    mv $* /tmp/wastebasket/
}

destroy() {
    shred -vzu -n 10 $*
}

