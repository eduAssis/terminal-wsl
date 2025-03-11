#!/bin/bash

# Função para perguntar se quer remover um pacote
ask_uninstall() {
    local var_name=$1
    local package_name=$2
    while true; do
        echo -e "\033[1;33mDeseja remover o pacote \033[1;36m$package_name\033[1;33m? (y/n)\033[0m"
        read -p "👉 " choice
        case "$choice" in
            y|Y ) eval "$var_name=true"; return 0;;
            n|N ) eval "$var_name=false"; return 1;;
            * ) echo -e "\033[1;31mResposta inválida! Digite 'y' para sim ou 'n' para não.\033[0m";;
        esac
    done
}

# Função para remover pacotes com a confirmação do usuário
uninstall_package() {
    echo -e "\n\033[1;31mRemovendo pacote $1...\033[0m"
    sudo apt-get remove --purge -y $1
    sudo apt-get autoremove -y
    sudo apt-get autoclean
    echo -e "\033[1;32mPacote $1 removido com sucesso!\033[0m"
}

echo -e "\n\033[1;33m######### Verificando pacotes instalados... #########\033[0m"
# .sh para verificar dependências instaladas
source verify_dependencies.sh

# Perguntar sobre pacotes a serem removidos
if [ "$IS_GIT_INSTALLED" = "true" ]; then
    ask_uninstall REMOVE_GIT "git"
fi

if [ "$IS_GIT_FLOW_INSTALLED" = "true" ]; then
    ask_uninstall REMOVE_GIT_FLOW "git-flow"
fi

if [ "$IS_CURL_INSTALLED" = "true" ]; then
    ask_uninstall REMOVE_CURL "curl"
fi

if [ "$IS_NVIM_INSTALLED" = "true" ]; then
    ask_uninstall REMOVE_NVIM "neovim"
fi

if [ "$IS_HTOP_INSTALLED" = "true" ]; then
    ask_uninstall REMOVE_HTOP "htop"
fi

if [ "$IS_TMUX_INSTALLED" = "true" ]; then
    ask_uninstall REMOVE_TMUX "tmux"
fi

if [ "$IS_FISH_INSTALLED" = "true" ]; then
    ask_uninstall REMOVE_FISH "fish"
fi

if [ "$IS_ZSH_INSTALLED" = "true" ]; then
    ask_uninstall REMOVE_ZSH "zsh"
fi

echo -e "\n\033[1;31m######### Restaurando Bash como shell padrão... #########\033[0m"
chsh -s $(which bash)

echo -e "\n\033[1;31m######### Iniciando remoções conforme confirmado... #########\033[0m"

# Remover pacotes
if [ "$REMOVE_GIT" = "true" ]; then uninstall_package "git"; fi
if [ "$REMOVE_GIT_FLOW" = "true" ]; then uninstall_package "git-flow"; fi
if [ "$REMOVE_CURL" = "true" ]; then uninstall_package "curl"; fi
if [ "$REMOVE_NVIM" = "true" ]; then uninstall_package "neovim"; fi
if [ "$REMOVE_HTOP" = "true" ]; then uninstall_package "htop"; fi
if [ "$REMOVE_TMUX" = "true" ]; then uninstall_package "tmux"; fi
if [ "$REMOVE_FISH" = "true" ]; then uninstall_package "fish"; fi
if [ "$REMOVE_ZSH" = "true" ]; then uninstall_package "zsh"; fi

# Remover arquivos de configuração
if [ "$REMOVE_ZSH" = "true" ]; then
    echo -e "\n\033[1;31mRemovendo arquivos de configuração do Zsh...\033[0m"
    rm -rf ~/.zshrc
    rm -rf ~/.zsh_history
    rm -rf ~/.oh-my-zsh
    rm -rf ~/.shell.pre-oh-my-zsh
    rm -rf ~/.p10k.zsh
fi

if [ "$REMOVE_VIM" = "true" ]; then
    echo -e "\n\033[1;31mRemovendo arquivos de configuração do Vim e Neovim...\033[0m"
    rm -rf ~/.git
    rm -rf ~/.vim
    rm -rf ~/.viminfo
    rm -rf ~/.config/nvim
fi

echo -e "\n\033[1;31m######### Limpando o cache de comandos do shell... #########\033[0m"
hash -r
unset ZSH

# Verificar arquivos residuais no diretório home
echo -e "\n\033[1;33m######### Verificando arquivos residuais no diretório home... #########\033[0m"
ls -a ~ | grep -E "(git|vim|nvim|zsh)"

echo -e "\n\033[1;32m######### Remoção concluída! #########\033[0m"