[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -alh --group-directories-first --color=always'

alias vim=nvim

PS1='nvim-${COMMIT:-local}:\w\$ '
