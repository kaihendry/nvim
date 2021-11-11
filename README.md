Map leader key is <kbd>Space</kbd>

# Goal

1. Reproduce my https://github.com/kaihendry/dotfiles/tree/master/.config/nvim
2. Have fun.

# How to run from bash

Setup an alias:

	alias hen='f(){ docker run -it --rm -v $(pwd):/src hendry/nvim; unset -f f; }; f'

Type `hen` to drop you into my editing environment!
