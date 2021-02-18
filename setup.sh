#!/usr/bin/env bash

bold=$(tput bold)
norm=$(tput sgr0)
warn=$(tput setaf 1)

PACKAGES=(
    tmux
    htop
    zsh
    build-essential
    curl
    wget
    xclip
    tree
)

function install_neovim() {
    echo "${bold}==> installing neovim${norm}"
    
    CUSTOM_NVIM_PATH="$HOME/.local/bin/nvim"
    mkdir -p "~/.local/bin/"
    curl -L https://github.com/neovim/neovim/releases/latest/download/nvim.appimage -o "${CUSTOM_NVIM_PATH}"
    chmod u+x "${CUSTOM_NVIM_PATH}"

    # Set the above with the correct path, then run the rest of the commands:
    set -u
    sudo update-alternatives --install /usr/bin/ex ex "${CUSTOM_NVIM_PATH}" 110
    sudo update-alternatives --install /usr/bin/vi vi "${CUSTOM_NVIM_PATH}" 110
    sudo update-alternatives --install /usr/bin/view view "${CUSTOM_NVIM_PATH}" 110
    sudo update-alternatives --install /usr/bin/vim vim "${CUSTOM_NVIM_PATH}" 110
    sudo update-alternatives --install /usr/bin/vimdiff vimdiff "${CUSTOM_NVIM_PATH}" 110

    mkdir -p "~/.config/nvim"
    ln -s ~/.dotfiles/init.vim  ~/.config/nvim/init.vim
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

function install_dotfiles() {
    echo "${bold}==> installing dotfiles${norm}"
    ln -s ~/.dotfiles/zshrc ~/.zshrc
    ln -s ~/.dotfiles/gitconfig ~/.gitconfig
    ln -s ~/.dotfiles/tmux.conf ~/.tmux.conf

}

function install_ohmyzsh() {

    if [[ -d ~/.dotfiles/oh-my-zsh ]]; then
        echo "${bold}oh-my-zsh is already installed${norm}"
        exit
    fi

    echo "${bold}==> installing oh-my-zsh${norm}"
    git clone https://github.com/ohmyzsh/ohmyzsh.git ~/.dotfiles/oh-my-zsh
    chsh -s $(which zsh)
    echo "🍻 ${bold}oh-my-zsh has been installed${norm}"
}

function install_essential_packages() {
    echo "${bold}==> installing essential packages${norm}"
    echo "Packages: ${PACKAGES[@]}"
    sudo apt update && sudo apt upgrade
    sudo apt install -y ${PACKAGES[@]}
    echo "🍻 ${bold}essential packages has been installed${norm}"
}


PROGRAMS=(
    $(typeset -f | awk '/^install_/ {gsub(/install_/, ""); print $1}')
)

function list_programs() {
    echo "${bold}==> you can install the following:${norm}"
    for program in ${PROGRAMS[@]}; do 
        echo "- $program"
    done
}

for arg in "$@"; do
    case $arg in
        all)
            for program in ${PROGRAMS[@]}; do
                install_program="install_${program}"
                $install_program
            done
            ;;
        
        list)
            list_programs
            ;;
        *)
            if  [[ "${PROGRAMS[@]}" =~ "${arg}" ]]; then
                install_program="install_${arg}"
                $install_program
            else
                echo "${warn}it's not possible to install: ${bold}${program}${norm}"
                list_programs
            fi 
            ;;
    esac
done
