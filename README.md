# Goal

To edit [AWS CDK](https://docs.aws.amazon.com/cdk/latest/guide/work-with-cdk-javascript.html) with some sanity.

# Blog

https://dabase.com/tips/vim/2021/Editing-Javascript-in-vim-in-Docker/

# Docker image

https://hub.docker.com/repository/docker/hendry/nvim

# How to run from bash

alias je='f(){ docker run -it --rm -v $(pwd):/proj hendry/nvim; unset -f f; }; f'

# Bootstrap

* https://gist.github.com/clason/b9b64a8ceb67d00c245dc58743bb053c#file-minimal-lua-L56-L62
* https://github.com/neovim/nvim-lspconfig/blob/903a1fbca91b74e6fbc905366ce38364b9d7ba98/test/minimal_init.lua#L74-L83
