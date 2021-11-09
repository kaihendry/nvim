FROM archlinux
LABEL maintainer="hendry@iki.fi"

ARG BRANCH="master"
ARG COMMIT=""
LABEL branch=${BRANCH}
LABEL commit=${COMMIT}

RUN useradd -m dev
RUN echo "dev ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

RUN sed -i "s/#Color/Color/" /etc/pacman.conf

RUN pacman --cachedir /tmp -Syu --noconfirm \
	base-devel \
	bash \
	git \
	nodejs \
	npm \
	jq \
	sudo \
	prettier \
	tar \
	tmux \
	neovim \
	yamllint \
	&& rm -rf /tmp/*

USER dev
ENV TERM alacritty

RUN git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 /home/dev/.local/share/nvim/site/pack/packer/start/packer.nvim

RUN cd /home/dev && \
	git init && \
	git remote add -f origin https://github.com/kaihendry/dotfiles.git && \
	git config core.sparseCheckout true

COPY --chown=dev:dev sparse-checkout /home/dev/.git/info/sparse-checkout

RUN cd /home/dev && git pull origin master

COPY --chown=dev:dev bashrc /home/dev/.bashrc

WORKDIR /src

ENV COMMIT_SHA=${COMMIT}
ENV COMMIT_BRANCH=${BRANCH}

ENTRYPOINT [ "bash" ]
