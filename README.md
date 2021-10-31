# Goal

To edit AWS CDK with some sanity.

# Blog

https://dabase.com/tips/vim/2021/Editing-Javascript-in-vim-in-Docker/

# Docker image

https://hub.docker.com/repository/docker/hendry/js-nvim

# How to run from bash

alias je='f(){ docker run -it --rm -v $(pwd):/proj hendry/js-nvim; unset -f f; }; f'
