#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -alhF'
alias grep='grep --color=auto'
alias vim='nvim'

BLUE="\[\e[0;34m\]"
RESET="\[\e[0m\]"

PS1="$BLUEλ \W $ $RESET"

