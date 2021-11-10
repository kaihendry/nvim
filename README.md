# Goal

1. Reproduce my https://github.com/kaihendry/dotfiles/tree/master/.config/nvim
2. Have fun.

# How to run from bash

	alias je='f(){ docker run -it --rm -v $(pwd):/proj hendry/nvim; unset -f f; }; f'
