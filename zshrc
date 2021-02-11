#!/usr/bin/env zsh
# source: https://github.com/jxlil/dotfiles

export DOTFILES="$HOME/.dotfiles"
export ZSH="$DOTFILES/oh-my-zsh"
export ZSH_CUSTOM="$DOTFILES/custom-oh-my-zsh"

# add local bin
export PATH="$HOME/.local/bin/":$PATH

# theme
ZSH_THEME="fishy"

# plugins
plugins=(git extract gen-ssh)

source $ZSH/oh-my-zsh.sh

# alias
alias vimrc="nvim ~/.config/nvim/init.vim"
alias dotfiles="cd ~/.dotfiles"
alias zshrc="nvim ~/.zshrc"
alias py="python3.8"
alias tb="taskbook"
alias cp="cp -r"
alias v="nvim"


# functions

pi() {
	py -m pip install $1 
}

update() {
	sudo apt update -y
	sudo apt dist-upgrade -y
	sudo apt autoremove -y
}

trash() {
	mkdir -p /tmp/wastebasket
	for junk_file in ${@}; do 
		mv $junk_file /tmp/wastebasket/${junk_file}-$(date +%y%m%d%H%M%S)
	done
}

destroy() {
	shred -vzu -n 10 $*
}



