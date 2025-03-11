#!/bin/bash
if [ "$IS_APT_INSTALLED" = "false" ]; then
    echo -e "\n\033[1;31m❌ O gerenciador de pacotes 'apt' não está instalado!\033[0m"
    while true; do
        read -p "👉 Deseja instalar o apt? (y/n) " choice
        case "$choice" in
            y|Y )
                echo -e "\n\033[1;33m🔄 Instalando apt...\033[0m"
                # Se o sudo não estiver instalado, usaremos o root diretamente
                if [ "$(id -u)" -ne 0 ]; then
                    echo -e "\033[1;33m🔄 Usando root diretamente para instalar o apt...\033[0m"
                    su -c "apt update && apt install -y apt"
                else
                    apt update && apt install -y apt
                fi
                echo -e "\033[1;32m✅ apt instalado com sucesso!\033[0m"
                break
                ;;
            n|N )
                echo -e "\n\033[1;31m❌ O apt é necessário para continuar. Saindo...\033[0m"
                exit 1
                ;;
            * ) echo -e "\033[1;31mResposta inválida! Digite 'y' para sim ou 'n' para não.\033[0m";;
        esac
    done
else
    echo -e "\n\033[1;32m✅ Pré requisito: O gerenciador de pacotes 'apt' já está instalado!\033[0m"
fi

if [ "$IS_SUDO_INSTALLED" = "false" ]; then
    echo -e "\n\033[1;31m❌ O comando 'sudo' não está instalado!\033[0m"
    while true; do
        read -p "👉 Deseja instalar o sudo? (y/n) " choice
        case "$choice" in
            y|Y )
                echo -e "\n\033[1;33m🔄 Instalando sudo...\033[0m"
                apt update && apt install -y sudo
                echo -e "\033[1;32m✅ sudo instalado com sucesso!\033[0m"
                break
                ;;
            n|N )
                echo -e "\n\033[1;31m❌ sudo é necessário para continuar. Saindo...\033[0m"
                exit 1
                ;;
            * ) echo -e "\033[1;31mResposta inválida! Digite 'y' para sim ou 'n' para não.\033[0m";;
        esac
    done
else
    echo -e "\n\033[1;32m✅ Pré requisito: sudo já está instalado!\033[0m"
fi

echo -e "\n\033[1;32m✅ Pré requisitos verificados! Continuando...\033[0m"