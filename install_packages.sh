#!/bin/bash

echo -e "\n\033[1;34m🚀 Iniciando instalação dos pacotes selecionados...\033[0m"
echo -e "\n\033[1;33m🔄 Atualizando informações dos pacotes UBUNTU...\033[0m"
sudo apt update
echo -e "✅ Informações dos pacotes atualizadas!"
echo -e "\n\033[1;33m🔄 Atualizando pacotes instalados...\033[0m"
sudo apt upgrade -y
echo -e "✅ Pacotes instalados e atualizados!"

if [ "$INSTALL_GIT" = true ]; then
    echo -e "\n\033[1;33m🔄 Instalando GIT...\033[0m"
    sudo apt install -y git
    git config --global pager.branch false
    echo -e "✅ GIT instalado!"
fi

if [ "$INSTALL_GIT_FLOW" = true ]; then
    echo -e "\n\033[1;33m🔄 Instalando GIT Flow...\033[0m"
    sudo apt install -y git-flow
    echo -e "✅ GIT Flow instalado!"
fi

if [ "$INSTALL_CURL" = true ]; then
    echo -e "\n\033[1;33m🔄 Instalando CURL...\033[0m"
    sudo apt install -y curl
    echo -e "✅ CURL instalado!"
fi

if [ "$INSTALL_NVIM" = true ]; then
    echo -e "\n\033[1;33m🔄 Instalando Neovim...\033[0m"
    sudo apt install -y neovim
    echo -e "✅ Neovim instalado!"
fi

if [ "$INSTALL_HTOP" = true ]; then
    echo -e "\n\033[1;33m🔄 Instalando Htop...\033[0m"
    sudo apt install -y htop
    echo -e "✅ Htop instalado!"
fi

if [ "$INSTALL_TMUX" = true ]; then
    echo -e "\n\033[1;33m🔄 Instalando Tmux...\033[0m"
    sudo apt install -y tmux
    echo -e "✅ Tmux instalado!"
fi

if [ "$INSTALL_FISH" = true ]; then
    echo -e "\n\033[1;33m🔄 Instalando Fish...\033[0m"
    sudo apt install -y fish
    echo -e "✅ Fish instalado!"
fi

if [ "$INSTALL_ZSH" = true ]; then
    echo -e "\n\033[1;33m🔄 Instalando Zsh...\033[0m"
    sudo apt install -y zsh
    echo -e "✅ Zsh instalado!"
fi

if [ "$INSTALL_OH_MY_ZSH" = true ]; then
    echo -e "\n\033[1;33m🔄 Instalando Oh My Zsh...\033[0m"
    RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" --unattended
    echo -e "✅ Oh My Zsh instalado!"
fi

if [ "$INSTALL_P10K" = true ]; then
    echo -e "\n\033[1;33m🔄 Instalando powerlevel10k...\033[0m"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
    echo -e "✅ powerlevel10k instalado!"
fi

if [ "$INSTALL_ZSH_AUTOSUGGESTIONS" = true ]; then
    echo -e "\n\033[1;33m🔄 Instalando Oh zsh-autosuggestions...\033[0m"
    git clone https://github.com/zsh-users/zsh-autosuggestions $HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions
    echo -e "✅ zsh-autosuggestions instalado!"
fi

if [ "$INSTALL_ZSH_SYNTAX_HIGHLIGHTING" = true ]; then
    echo -e "\n\033[1;33m🔄 Instalando zsh-syntax-highlighting...\033[0m"
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
    echo -e "✅ zsh-syntax-highlighting instalado!"
fi

echo -e "\n\033[1;32m✅ Todos os pacotes selecionados foram instalados com sucesso! 🚀\033[0m"
