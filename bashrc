[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -alh --group-directories-first --color=always'

alias vim=nvim

[[ -s /etc/profile.d/autojump.sh ]] && source /etc/profile.d/autojump.sh

eval "$(starship init bash)"
