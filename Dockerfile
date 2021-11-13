FROM oblique/archlinux-yay
LABEL maintainer="hendry@iki.fi"

ARG COMMIT=""

RUN useradd -m dev
RUN echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN sed -i "s/#Color/Color/" /etc/pacman.conf

USER dev

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

RUN INSTALL=1 nvim --headless +'autocmd User PackerComplete sleep 100m | qall' +PackerSync

COPY --chown=dev:dev bashrc /home/dev/.bashrc

WORKDIR /src

ENV COMMIT=${COMMIT}

ENTRYPOINT [ "bash" ]
