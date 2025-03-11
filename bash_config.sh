#!/bin/bash

# Garante que o ~/.bashrc existe
mv ~/.bashrc ~/.bashrc.old
touch ~/.bashrc

# Atualiza o .bashrc
echo -e "\n\033[1;32m🔄 Atualizando .bashrc e adicionando aliases...\033[0m"
cat <<EOF > $HOME/.bashrc

export HISTCONTROL=ignoredups:erasedups  # Evita duplicatas no histórico
export HISTSIZE=10000                    # Aumenta o tamanho do histórico
export HISTFILESIZE=20000
shopt -s histappend                       # Mantém histórico entre sessões

# Ativar auto-completar melhorado
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

# Carregar aliases
[ -f $HOME/terminal-wsl/aliases ] && source $HOME/terminal-wsl/aliases
EOF

echo -e "✅ Configuração do Bash concluída!"
