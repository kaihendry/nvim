FROM quay.io/nvim-lsp/try.nvim:base-nightly

# https://github.com/nvim-lsp/try.nvim/blob/master/typescript/Dockerfile

RUN apk --no-cache add nodejs git npm ripgrep fd bash

# https://github.com/lourenci/docker/tree/master/images/neovim-ide

# TODO setup yaml-language-server 
# https://www.reddit.com/r/neovim/comments/pta1ka/unable_to_configure_yamllanguageserver/
RUN npm i -g typescript typescript-language-server vscode-langservers-extracted yaml-language-server \
  dockerfile-language-server-nodejs diagnostic-languageserver && \
  npm cache clean --force

COPY nvim /root/.config/nvim

RUN INSTALL=1 nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

COPY bashrc /root/.bashrc

ENV COMMIT=${COMMIT}

WORKDIR /src

ENTRYPOINT ["nvim"]
