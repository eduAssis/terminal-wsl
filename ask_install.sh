#!/bin/bash

ask_install() {
    local var_name=$1
    local package_name=$2
    while true; do
        echo -e "\n\033[1;33m⚠️  Deseja instalar o pacote \033[1;36m$package_name\033[1;33m? (y/n)\033[0m"
        read -p "👉 " choice
        case "$choice" in
            y|Y ) eval "$var_name=true"; return 0;;
            n|N ) eval "$var_name=false"; return 1;;
            * ) echo -e "\033[1;31mResposta inválida! Por favor, digite 'y' para sim ou 'n' para não.\033[0m";;
        esac
    done
}

# Pergunta ao usuário apenas se o pacote não estiver instalado

if [ "$IS_GIT_INSTALLED" = "false" ]; then
    ask_install INSTALL_GIT "Git"
else
    echo -e "\n\033[1;33m✅ Git já está instalado.\033[0m"
fi

if [ "$IS_GIT_FLOW_INSTALLED" = "false" ]; then
    ask_install INSTALL_GIT_FLOW "Git Flow"
else
    echo -e "\n\033[1;33m✅ Git Flow já está instalado.\033[0m"
fi

if [ "$IS_CURL_INSTALLED" = "false" ]; then
    ask_install INSTALL_CURL "Curl"
else
    echo -e "\n\033[1;33m✅ Curl já está instalado.\033[0m"
fi

if [ "$IS_NVIM_INSTALLED" = "false" ]; then
    ask_install INSTALL_NVIM "Neovim"
else
    echo -e "\n\033[1;33m✅ Neovim já está instalado.\033[0m"
fi

if [ "$IS_HTOP_INSTALLED" = "false" ]; then
    ask_install INSTALL_HTOP "htop"
else
    echo -e "\n\033[1;33m✅ htop já está instalado.\033[0m"
fi

if [ "$IS_TMUX_INSTALLED" = "false" ]; then
    ask_install INSTALL_TMUX "tmux"
else
    echo -e "\n\033[1;33m✅ tmux já está instalado.\033[0m"
fi

if [ "$IS_FISH_INSTALLED" = "false" ]; then
    ask_install INSTALL_FISH "Fish"
else
    echo -e "\n\033[1;33m✅ Fish já está instalado.\033[0m"
fi

if [ "$IS_ZSH_INSTALLED" = "false" ]; then
    ask_install INSTALL_ZSH "Zsh"
else
    echo -e "\n\033[1;33m✅ Zsh já está instalado.\033[0m"
fi

if [ "$INSTALL_ZSH" = "true" ]; then
    if [ "$IS_CURL_INSTALLED" = "true" ] || [ "$INSTALL_CURL" = "true" ]; then
        if [ "$IS_OH_MY_ZSH_INSTALLED" = "false" ]; then
            ask_install INSTALL_OH_MY_ZSH "Oh MyZsh"
        else
            echo -e "\n\033[1;33m✅ Oh My Zsh já está instalado.\033[0m"
        fi
    fi

    if [ "$IS_GIT_INSTALLED" = "true" ] || [ "$INSTALL_GIT" = "true" ]; then
        if [ "$IS_P10K_INSTALLED" = "false" ]; then
            ask_install INSTALL_P10K "Tema Powerlevel10k"
        else
            echo -e "\n\033[1;33m✅ Powerlevel10k já está instalado.\033[0m"
        fi

        if [ "$IS_ZSH_AUTOSUGGESTIONS_INSTALLED" = "false" ]; then
            ask_install INSTALL_ZSH_AUTOSUGGESTIONS "zsh-autosuggestions"
        else
            echo -e "\n\033[1;33m✅ zsh-autosuggestions já está instalado.\033[0m"
        fi

        if [ "$IS_ZSH_SYNTAX_HIGHLIGHTING_INSTALLED" = "false" ]; then
            ask_install INSTALL_ZSH_SYNTAX_HIGHLIGHTING "zsh-syntax-highlighting"
        else
            echo -e "\n\033[1;33m✅ zsh-syntax-highlighting já está instalado.\033[0m"
        fi
    fi
 fi