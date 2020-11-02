#!/usr/bin/env zsh

gen-ssh() {
    if [[ $# -eq 0 ]]; then
        echo "[x] You need to specify an email"
        echo "example: $ gen-ssh example@domain.com"
        return 1
    fi

    echo "[+] Generate a new SSH key"
    ssh-keygen -t rsa -b 4096 -C "$1"

    echo "[+] Add your SSH key to the ssh-agent"
    eval "$(ssh-agent -s)"
    ssh-add ~/.ssh/id_rsa

    echo "[+] The SSH key has been copied to your clipboard"
    cat ~/.ssh/id_rsa.pub | xclip -selection clipboard
}
