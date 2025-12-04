#
# ~/.bashrc
#

[[ $- != *i* ]] && return

LS_COLORS=$LS_COLORS:'di=01;31';
export LS_COLORS
export EDITOR='nvim'
export TERMINAL=alacritty

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias i3config='nvim ~/.dotfiles/i3/.config/i3/config'
alias gh='cd ~; clear'
alias bye='systemctl poweroff'
alias shutdown='systemctl poweroff'
alias reboot='systemctl reboot'
alias suspend='systemctl suspend'
alias q='exit'

PS1='\[\e[1m\]\u\[\e[00;31m\]@\[\e[0;1m\]\h\[\e[0m\] \[\e[00;31m\]\w\[\e[0m\] \$ '
fastfetch

# c compile and run (cpp)
#cpp() {
#    if [ -z "$1" ]; then
#        echo "Uso correto: cpp programa (sem extensão de arquivo)"
#        return 1
#    fi
#
#    local base="$1"
#    local src="$base"
#
#    # adiciona .c se não tiver
#    [[ "$src" != *.cpp ]] && src="${src}.cpp"
#
#    local out="${src%.cpp}"
#
#    # compila o arquivo e gera um binário
#    g++ "$src" -o "${out}.o"
#    if [ $? -ne 0 ]; then
#        echo "Erro ao compilar o arquivo!"
#        return 1
#   fi
#
#    # executa o binário
#    "./${out}.o"
#}
