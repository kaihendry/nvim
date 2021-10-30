map <F8> :setlocal spell! spelllang=en_gb<CR>
set title
set ruler
set showmatch
set ignorecase
set incsearch
set hlsearch
set bs=2
set nobackup

" https://en.parceljs.org/hmr.html#safe-write
set backupcopy=yes

set encoding=utf-8

set diffopt+=iwhite " Ignore whitespace whilst diffing
nnoremap <silent> <F5> :%s/\s\+$//<cr>

set list listchars=nbsp:¬,tab:»·,trail:·,extends:>
set shiftwidth=4
set softtabstop=4
set tabstop=4

set background=dark

set undofile
set undodir=/tmp

syntax on
filetype plugin indent on
set nofoldenable

" Using tabless https://www.npmjs.com/package/standard
autocmd Filetype javascript setlocal sw=2 sts=2 expandtab

call plug#begin('~/.vim/plugged')

" JS stuff and JSON/YAML formatting
Plug 'dense-analysis/ale'

" So commenting in & out code blocks works
Plug 'tpope/vim-commentary'

Plug 'ctrlpvim/ctrlp'

" Autocompletion
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

autocmd Filetype vue setlocal sw=2 sts=2 expandtab

set wildmode=longest,list,full
set wildmenu

" https://github.com/ctrlpvim/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" restore cursor position when reopening a file, except if it's a git commit
autocmd BufReadPost * if @% !~# '\.git[\/\\]COMMIT_EDITMSG$' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" standard-prettier
let g:ale_fixers = {'javascript': ['prettier'], 'json': ['jq']}
let g:ale_linters = {'javascript': ['prettier'],'CloudFormation' : ['cfn-lint']}
let g:ale_sign_column_alwayus = 1
let g:ale_fix_on_save = 1

nnoremap <silent><Leader>r :vsplit term://go run %<CR>

let g:nvim_typescript#javascript_support = 1

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" https://youtu.be/PEm0QJ46hNo
inoremap <C-H> <C-W>

let g:indent_guides_enable_on_vim_startup = 1
