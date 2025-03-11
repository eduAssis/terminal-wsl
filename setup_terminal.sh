#!/bin/bash

clear
echo -e "\n\033[1;32m🚀 Iniciando a configuração WSL UBUNTU...\033[0m"

while true; do
    echo -e "\n\033[1;34m⚙️  Escolha uma opção:\033[0m"
    echo -e "0) Cancelar e sair"
    echo -e "1) Remover configuração"
    echo -e "2) Instalar novamente"
    read -p "👉 Digite o número correspondente (0, 1 ou 2): " OPTION
    case "$OPTION" in
        0) echo -e "\n\033[1;33mOperação cancelada.\033[0m"; exit ;;
        1) 
            echo -e "\n\033[1;31m🔄 Removendo configuração...\033[0m"
            source remove_setup.sh
            exit ;;
        2) 
            echo -e "\n\033[1;32m🔄 Iniciando nova instalação...\033[0m"
            break ;;
        *) 
            echo -e "\033[1;31mResposta inválida! Escolha 0, 1 ou 2.\033[0m" ;;
    esac
done

echo -e "\n\033[1;32m✅ HOME: \033[0m" $HOME
echo -e "\n\033[1;32m✅ SHELL: \033[0m" $SHELL

# .sh para verificar dependências instaladas
source verify_dependencies.sh
# .sh para verificar pré requisitos (sudo, apt)
source prerequisite_check.sh

echo -e "\n\033[1;33m✨ Pacotes para instalação:\033[0m"
echo -e "\033[1;36m- Git\033[0m"
echo -e "\033[1;36m- Curl\033[0m"
echo -e "\033[1;36m- Neovim\033[0m"
echo -e "\033[1;36m- Htop\033[0m"
echo -e "\033[1;36m- Tmux\033[0m"
echo -e "\033[1;36m- Fish\033[0m: Como alternativa ao Bash."
echo -e "\033[1;36m- Zsh\033[0m: Como alternativa ao Bash."
echo -e "\033[1;36m- Oh My Zsh\033[0m: Gerencia configuração do Zsh."
echo -e "\033[1;36m- Powerlevel10k\033[0m: Tema para Zsh."
echo -e "\033[1;36m- Plugins do Zsh (zsh-autosuggestions e zsh-syntax-highlighting)\033[0m"
echo -e "\n\033[1;33m⚠️  Alguns desses pacotes têm dependências específicas:\033[0m"
echo -e "\033[1;36m- Git\033[0m Necessário para instalar plugins como o Powerlevel10k e o zsh-autosuggestions."
echo -e "\033[1;36m- Curl\033[0m Necessário para instalar o Oh My Zsh e outros pacotes.\033[0m"

while true; do
    echo -e "\n\033[1;34m⚙️  Você deseja continuar com a instalação?\033[0m"
    echo -e "1) Sim, continuar"
    echo -e "2) Não, cancelar"
    read -p "👉 Digite o número correspondente (1 ou 2): " choice

    case "$choice" in
        1) break ;;  # Prossegue com a instalação
        2) echo -e "\n\033[1;31m❌ Instalação cancelada pelo usuário.\033[0m\n"; exit 0 ;;
        *) echo -e "\033[1;31mResposta inválida! Digite 1 para continuar ou 2 para cancelar.\033[0m" ;;
    esac
done

# .sh para escolher qual shell (zsh ou fish)
source shell_choice.sh
# .sh para verificar opções de instalação do usuário
source ask_install.sh
# .sh com instalação dos pacotes selecionados
source install_packages.sh
# configuração do shell escolhido (shell_choice)
source $SHELL_CONFIG_SCRIPT

# shell padrão
while true; do
    CURRENT_SHELL=$(basename "$SHELL")
    echo -e "\n\033[1;34m⚙️  Deseja tornar o $SHELL_NAME como o seu SHELL padrão?\033[0m"
    echo -e "1) Sim, alterar para $SHELL_NAME"
    echo -e "2) Não, manter o shell atual ($CURRENT_SHELL)"
    read -p "👉 Digite o número correspondente (1 ou 2): " choice

    case "$choice" in
        1 ) 
            SHELL_PATH="$(command -v $SHELL_NAME)"
            if [ -n "$SHELL_PATH" ]; then
                chsh -s "$SHELL_PATH"
                echo -e "\n✅ Shell padrão alterado para: $SHELL_NAME ($SHELL_PATH)"
            else
                echo -e "\n\033[1;31m❌ Erro: O shell $SHELL_NAME não foi encontrado.\033[0m"
            fi
            break
            ;;
        2 ) 
            echo -e "\n🛑 Alteração de shell cancelada."
            break
            ;;
        * ) 
            echo -e "\033[1;31mResposta inválida! Por favor, digite '1' para sim ou '2' para não.\033[0m"
            ;;
    esac
done

echo -e "\n\033[1;32m✅ SHELL padrão:\033[0m" $SHELL
echo -e "\n\033[1;32m✅ Configuração do $SHELL_NAME concluída!\033[0m\n"

export SHELL="$(command -v $SHELL_NAME)"
exec "$SHELL"