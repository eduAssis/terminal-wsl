#!/bin/bash

echo -e "\n\033[1;32m🔄 Configurando Fish...\033[0m"

mkdir -p ~/.config/fish

# Criando config.fish
cat <<EOF > ~/.config/fish/config.fish
# Definição de aliases
if test -f $HOME/terminal-wsl/aliases
    source $HOME/terminal-wsl/aliases
end
EOF

echo -e "\n\033[1;32m✅ Fish configurado!\033[0m"
