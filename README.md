https://dabase.com/tips/vim/2021/Editing-Javascript-in-vim-in-Docker/

alias je='f(){ docker run -it --rm -v $(pwd):/proj hendry/js-nvim; unset -f f; }; f'
