# 🚀 Configuração do Terminal (Ubuntu + Zsh + Oh My Zsh)

## 📌 Sobre o Projeto
Este script automatiza a instalação e configuração do terminal no Ubuntu, incluindo:
- Git, Curl, Neovim, Tmux
- Fish
- Zsh, Oh My Zsh, tema Powerlevel10k e plugins para o Zsh (autosuggestions e syntax-highlighting)

Ao executar o script, o usuário pode escolher quais componentes deseja instalar.

---

## 📋 Requisitos
Antes de rodar este script, verifique se seu Ubuntu possui:
- Permissão de superusuário (`sudo` configurado)
- Gerenciador de pacotes 'apt'
- Acesso à internet para baixar dependências

Alguns desses pacotes têm dependências específicas:
- Git é necessário para instalar plugins como o Powerlevel10k e o zsh-autosuggestions
- Curl é necessário para instalar o Oh My Zsh e outros pacotes

Caso esteja rodando dentro de um container Docker, certifique-se de que o `sudo` esteja instalado:
```bash
apt update && apt install -y sudo
```

---

## 🚀 Como Usar
### 1️⃣ Clone o Repositório
```bash
git clone https://github.com/eduAssis/terminal-wsl.git
cd terminal-wsl
```

### 2️⃣ Dê Permissão de Execução
```bash
chmod +x setup_terminal.sh
```

### 3️⃣ Execute o Script
```bash
./setup_terminal.sh
```

---

## **Desenvolvido por Eduardo de Assis** 

- 🚀 **[GitHub](https://github.com/eduAssis)**
- 💼 **[LinkedIn](https://www.linkedin.com/in/eduardo-de-assis-21b308153)**