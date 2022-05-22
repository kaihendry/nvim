FROM node:16-alpine
LABEL maintainer="hendry@iki.fi"

ARG COMMIT=""

# https://github.com/nvim-lsp/try.nvim/blob/master/typescript/Dockerfile

# https://pkgs.alpinelinux.org/packages
RUN apk --no-cache add git npm ripgrep fd bash shellcheck go shfmt gzip

RUN apk add neovim --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim\
	~/.local/share/nvim/site/pack/packer/start/packer.nvim

RUN npm install -g \
	eslint \
	write-good \
	prettier && npm cache clean --force

COPY nvim /root/.config/nvim

RUN INSTALL=1 nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' && \
	nvim --headless \
	-c "LspInstall --sync bashls tsserver yamlls gopls" \
	-c q

COPY bashrc /root/.bashrc

ENV COMMIT=${COMMIT}

WORKDIR /src

ENTRYPOINT ["nvim"]
