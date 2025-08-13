#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Aliases
alias ls='ls --color=auto'
alias ll='ls -alhF'
alias grep='grep --color=auto'
alias sl='sl -e'
alias fetch='fastfetch'
alias vim='nvim'
alias vff='vim $(fzf --preview="bat {}")'
alias plasma='/usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland'
alias yt-mp3='yt-dlp --output "%(artist)s - %(title)s.%(ext)s" --extract-audio --embed-metadata --embed-thumbnail --audio-format mp3 --audio-quality 0'
alias yt-mp4='yt-dlp --format "bv*[ext=mp4]+ba[ext=m4a]/b[ext=mp4]"'
alias lg='looking-glass-client -s'
alias grub-update='sudo grub-mkconfig -o /boot/grub/grub.cfg'

# Environment variables
export PATH="$PATH:$HOME/.local/bin"

# Theme
BLUE="\[\e[0;34m\]"
RED="\[\e[0;91m\]"
RESET="\[\e[0m\]"

PS1="[\u@$RED\h$RESET \w]\$$RESET "

# Setup zoxide
eval "$(zoxide init --cmd cd bash)"

