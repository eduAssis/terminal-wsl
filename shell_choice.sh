#!/bin/bash

# Escolha do shell
CHOICE_ZSH=false
CHOICE_FISH=false

while true; do
    echo -e "\n\033[1;33m⚙️  Escolha o shell para instalar:\033[0m"
    echo -e "0) Para manter o bash como padrão"
    echo -e "1) Zsh"
    echo -e "2) Fish"
    read -p "👉 Digite o número correspondente (0, 1 ou 2): " shell_choice

    case "$shell_choice" in
        0) 
            SHELL_CONFIG_SCRIPT="bash_config.sh"
            SHELL_NAME="bash"
            break
            ;;
        1) 
            CHOICE_ZSH=true
            SHELL_CONFIG_SCRIPT="zshrc_config.sh"
            SHELL_NAME="zsh"
            break
            ;;
        2) 
            CHOICE_FISH=true
            SHELL_CONFIG_SCRIPT="fish_config.sh"
            SHELL_NAME="fish"
            break
            ;;
        *)
            echo -e "\033[1;31mOpção inválida! Escolha 1 para Zsh ou 2 para Fish.\033[0m"
            ;;
    esac
done

echo -e "\n\033[1;32m✅ Shell escolhido: $SHELL_NAME\033[0m"