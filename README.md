Map leader key is <kbd>Space</kbd>

# Goal

1. Reproduce my https://github.com/kaihendry/dotfiles/tree/master/.config/nvim
2. Have fun!

# How to run from bash

Setup an alias:

	alias n='docker run -it --rm -v $(pwd):/src hendry/nvim:latest $@'

or to invoke a shell:

	docker run -it --rm --entrypoint=bash -v $(pwd):/src hendry/nvim:latest
