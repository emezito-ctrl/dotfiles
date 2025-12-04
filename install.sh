#!/usr/sbin/env bash

packages=(
  papirus-icon-theme
  ttf-jetbrains-mono-nerd
  ttf-firacode-nerd
  stow
  rofi
  polybar
  i3-wm
  picom
  alacritty
  neovim
  htop
  fastfetch
  feh
  ripgrep
  python-pynvim
  python-pip
  pulseaudio
  pipewire
  npm
  nodejs
  git
  scrot
)

echo "🔄 Atualizando sistema..."
sudo pacman -Syu --noconfirm

echo "📦 Selecione os pacotes que deseja instalar:"
select pkg in "${packages[@]}" "Todos" "Sair"; do
  case $pkg in
    "Todos")
      for p in "${packages[@]}"; do
        if pacman -Qi "$p" &>/dev/null; then
          echo "✅ $p já está instalado, pulando..."
        else
          echo "📥 Instalando $p..."
          sudo pacman -S --noconfirm "$p"
        fi
      done
      ;;
    "Sair")
      break
      ;;
    *)
      if [[ -n "$pkg" ]]; then
        if pacman -Qi "$pkg" &>/dev/null; then
          echo "✅ $pkg já está instalado, pulando..."
        else
          echo "📥 Instalando $pkg..."
          sudo pacman -S --noconfirm "$pkg"
        fi
      else
        echo "⚠️ Opção inválida."
      fi
      ;;
  esac
done

# Pergunta sobre dotfiles
read -p "👉 Clonar e instalar os dotfiles com stow? (s/n): " answer
if [[ "$answer" == "s" || "$answer" == "S" ]]; then
  echo "📂 Clonando repositório emezito-ctrl/dotfiles..."
  if [ ! -d "$HOME/.dotfiles" ]; then
    git clone https://github.com/emezito-ctrl/dotfiles "$HOME/.dotfiles"
  else
    echo "⚠️ Pasta dotfiles já existe, pulando clone."
  fi

  cd "$HOME/.dotfiles" || exit
  
  echo "🗑️ Removendo arquivos antigos..."
  rm -f "$HOME/.config/i3/config" "$HOME/.bashrc"
  
  echo "🔗 Linkando dotfiles com stow..."
  stow */
  echo "🎉 Dotfiles aplicados com sucesso!"
else
  echo "⏭️ Pulando clonagem/instalação dos dotfiles."
fi

echo "✅ Script concluído!"
