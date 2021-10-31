FROM archlinux
LABEL maintainer="hendry@iki.fi"

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
	starship \
	sudo \
	prettier \
	tar \
	tmux \
	neovim \
	yamllint \
	&& rm -rf /tmp/*

USER dev
ENV TERM alacritty

COPY --chown=dev:dev vimrc /home/dev/.config/nvim/init.vim
COPY --chown=dev:dev bashrc /home/dev/.bashrc

RUN sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

RUN nvim --headless +PlugInstall +qa
RUN nvim +"CocInstall coc-tsserver coc-json coc-yaml coc-prettier" +qall

WORKDIR /proj

ENTRYPOINT [ "bash" ]
