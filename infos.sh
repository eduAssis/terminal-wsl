#!/bin/bash

# Cores
RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
YELLOW='\033[1;33m'
MAGENTA='\033[1;35m'
NC='\033[0m' # No Color

# Funções para coletar informações
USER=$(whoami)
HOSTNAME=$(hostname)
OS=$(lsb_release -d | cut -f2 2>/dev/null || cat /etc/os-release | grep PRETTY_NAME | cut -d= -f2 | tr -d '"')
KERNEL=$(uname -r)
UPTIME=$(uptime -p | sed 's/up //')
CPU=$(lscpu | grep "Model name" | sed 's/Model name:[ \t]*//' | xargs)
CORES=$(nproc)
MEMORY_USED=$(free -h | awk '/Mem:/ {print $3 " / " $2}')
SWAP_USED=$(free -h | awk '/Swap:/ {print $3 " / " $2}')
DISK_USED=$(df -h / | awk '/\// {print $3 " / " $2}')
IP=$(hostname -I | awk '{print $1}')
GPU=$(lspci | grep -i 'vga\|3d' | cut -d ':' -f3 | xargs)
PROCESSES=$(ps aux | wc -l)
LOGGED_USERS=$(who | wc -l)

PKGS=$(dpkg -l 2>/dev/null | wc -l || rpm -qa | wc -l) # Para Debian ou RedHat-based

# Exibe as informações
echo -e "${MAGENTA}==========================================${NC}"
echo -e "${GREEN}${USER}@${HOSTNAME}${NC}"
echo -e "${MAGENTA}==========================================${NC}"
echo -e "${YELLOW}Sistema:${NC}        $OS"
echo -e "${YELLOW}Kernel:${NC}         $KERNEL"
echo -e "${YELLOW}Uptime:${NC}         $UPTIME"
echo -e "${YELLOW}CPU:${NC}            $CPU ($CORES núcleos)"
echo -e "${YELLOW}Memória:${NC}        $MEMORY_USED"
echo -e "${YELLOW}Swap:${NC}           $SWAP_USED"
echo -e "${YELLOW}Disco (/):${NC}      $DISK_USED"
echo -e "${YELLOW}GPU:${NC}            $GPU"
echo -e "${YELLOW}IP Local:${NC}       $IP"
echo -e "${YELLOW}Temperatura CPU:${NC} ${TEMP_CPU:-"N/A"}"
echo -e "${YELLOW}Usuários logados:${NC} $LOGGED_USERS"
echo -e "${YELLOW}Processos ativos:${NC} $PROCESSES"
echo -e "${YELLOW}Pacotes instalados:${NC} $PKGS"
echo -e "${MAGENTA}==========================================${NC}"
