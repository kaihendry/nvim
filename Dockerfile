FROM archlinux:base
LABEL maintainer="hendry@iki.fi"

ARG COMMIT=""

RUN useradd -m dev
RUN echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN pacman -Sy --noconfirm git sudo base-devel

USER dev

WORKDIR /tmp

RUN curl https://aur.archlinux.org/cgit/aur.git/snapshot/yay-bin.tar.gz --output yay-bin.tar.gz && \
    tar -xzf yay-bin.tar.gz && \
    cd yay-bin && \
    makepkg -ci --noconfirm && \
    rm -rf yay-bin.tar.gz yay-bin

RUN yay --cachedir /tmp -Syu --noconfirm \
	nodejs \
	npm \
	jq \
	fd \
	ripgrep \
	neovim-nightly-bin \
	write-good \
	typescript-language-server-bin \
	yamllint \
	&& sudo rm -rf /tmp/*

COPY --chown=dev:dev nvim /home/dev/.config/nvim

RUN INSTALL=1 nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync' && \
    nvim --headless -c 'TSInstallSync maintained' -c 'q'

COPY --chown=dev:dev bashrc /home/dev/.bashrc

WORKDIR /src

ENV COMMIT=${COMMIT}

ENTRYPOINT [ "bash" ]
