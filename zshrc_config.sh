#!/bin/bash

# Garante que o ~/.zshrc existe
rm -f ~/.zshrc
touch ~/.zshrc

echo -e "\n\033[1;34m⚙️ Escolha o tema para o Zsh:\033[0m"

ZSH_THEME="af-magic"

if [ "$IS_P10K_INSTALLED" == "true" ]; then
    echo "1 - Powerlevel10k (p10k)"
    echo "Ou digite o nome do tema conforme disponível em https://github.com/ohmyzsh/ohmyzsh/wiki/Themes"
else
    echo "Digite o nome do tema conforme disponível em https://github.com/ohmyzsh/ohmyzsh/wiki/Themes"
fi

while true; do
    read -p "👉 Sua escolha: " ZSH_THEME_CHOICE

    if [ "$ZSH_THEME_CHOICE" == "1" ] && [ "$IS_P10K_INSTALLED" == "true" ]; then
        ZSH_THEME="powerlevel10k/powerlevel10k"
        P10K_THEME_CONFIG="[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh"
        break
    else
        if [ -f "$HOME/.oh-my-zsh/themes/$ZSH_THEME_CHOICE.zsh-theme" ]; then
            ZSH_THEME="$ZSH_THEME_CHOICE"
            break
        else
            echo -e "\n\033[1;31m❌ O tema '$ZSH_THEME_CHOICE' não foi encontrado. Escolha outro tema.\033[0m"
            echo "Digite o nome de um tema válido ou 1 para o Powerlevel10k."
        fi
    fi
done

# Atualiza o .zshrc
echo -e "\n\033[1;32m🔄 Atualizando .zshrc e adicionando aliases...\033[0m"
cat <<EOF > $HOME/.zshrc
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="$ZSH_THEME"
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source \$ZSH/oh-my-zsh.sh

$P10K_THEME_CONFIG

# Carregar aliases
[ -f $HOME/terminal-wsl/aliases ] && source $HOME/terminal-wsl/aliases
EOF

echo -e "\n\033[1;32m✅ Arquivo .zshrc atualizado com sucesso!\033[0m"