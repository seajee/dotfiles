#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -alhF'
alias grep='grep --color=auto'
alias sl='sl -e'
alias fetch='fastfetch'
alias vim='nvim'
alias vff='vim $(fzf --preview="bat {}")'
alias plasma='/usr/lib/plasma-dbus-run-session-if-needed /usr/bin/startplasma-wayland'
alias yt-mp3='yt-dlp --extract-audio --embed-metadata --embed-thumbnail --audio-format mp3 --audio-quality 0'
alias yt-mp4='echo TODO'

BLUE="\[\e[0;34m\]"
RESET="\[\e[0m\]"

PS1="$BLUEλ \W $ $RESET"

eval "$(zoxide init --cmd cd bash)"
