Map leader key is <kbd>Space</kbd>

# Goal

1. Reproduce my https://github.com/kaihendry/dotfiles/tree/master/.config/nvim
2. Have fun!

I'm trying to leverage the neovim language server as much as possible via `:LspInstallInfo`.

# How to run from bash

Setup an alias:

	alias n='docker run -it --rm -v $(pwd):/src hendry/nvim:latest $@'

or to invoke a shell:

	docker run -it --rm --entrypoint=bash -v $(pwd):/src hendry/nvim:latest

# LOC

	$ find -type f -name "*.lua" | xargs wc -l
	  25 ./nvim/lua/nvim-cmp.lua
	   6 ./nvim/lua/findstuff.lua
	  56 ./nvim/lua/lsp.lua
	  83 ./nvim/init.lua
	 170 total

My [.vimrc](https://github.com/kaihendry/dotfiles/blob/master/.vimrc) is ~130. The difference between vim and neovim is the language server and lua support.

# Key binds you should know

* <kbd>SPACE</kbd><kbd>ff</kbd> Find files via Telescope
* <kbd>SPACE</kbd><kbd>f</kbd> Format buffer