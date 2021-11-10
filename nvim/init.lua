-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
  augroup end
]],
  false
)

local use = require('packer').use
require('packer').startup(function()
	use 'wbthomason/packer.nvim' -- Package manager
	use {'dracula/vim', as = 'dracula'}
	use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
	use 'neovim/nvim-lspconfig' -- use a language server
	use 'hrsh7th/cmp-nvim-lsp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/nvim-cmp' -- for completion whilst using the language server
	use 'github/copilot.vim' -- for AI completion
	-- use 'hrsh7th/cmp-copilot'
	use 'saadparwaiz1/cmp_luasnip' -- vim cmp requires luasnip
	use 'L3MON4D3/LuaSnip' -- Snippets plugin

	use 'crispgm/nvim-go'
	use 'nvim-lua/plenary.nvim'
	use 'nvim-lua/popup.nvim'

	use 'jose-elias-alvarez/null-ls.nvim'
end)

if os.getenv('INSTALL') then
  goto eof
end

--Incremental live completion (note: this is now a default on master)
vim.o.inccommand = 'nosplit'

--Set highlight on search
vim.o.hlsearch = false

--Make line numbers default
vim.wo.number = true

--Do not save when switching buffers (note: this is now a default on master)
vim.o.hidden = true

--Enable mouse mode
vim.o.mouse = 'a'

--Enable break indent
vim.o.breakindent = true

--Save undo history
vim.opt.undofile = true

--Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

--Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

--Set colorscheme (order is important here)
vim.o.termguicolors = true
vim.cmd [[colorscheme dracula]]

require('lsp')
require('null')


::eof::
