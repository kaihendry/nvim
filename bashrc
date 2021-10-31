[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -alh --group-directories-first --color=always'

alias vim=nvim

function blastoff(){
	jq .dependencies ~/.config/coc/extensions/package.json
}
starship_precmd_user_func="blastoff"

eval "$(starship init bash)"
