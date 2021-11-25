FROM quay.io/nvim-lsp/try.nvim:base-nightly
LABEL maintainer="hendry@iki.fi"

ARG COMMIT=""

# https://github.com/nvim-lsp/try.nvim/blob/master/typescript/Dockerfile

# https://pkgs.alpinelinux.org/packages
RUN apk --no-cache add nodejs git npm ripgrep fd bash shellcheck go

COPY nvim /root/.config/nvim

RUN INSTALL=1 nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' && \
	nvim --headless \
	-c "LspInstall --sync bashls tsserver yamlls efm gopls" \
	-c q

COPY bashrc /root/.bashrc

ENV COMMIT=${COMMIT}

WORKDIR /src

ENTRYPOINT ["nvim"]
