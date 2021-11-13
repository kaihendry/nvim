PRJSRC=$(shell pwd)
IMAGE=hendry/nvim

# alias je='f(){ docker run -it --rm -v $(pwd):/proj hendry/nvim; unset -f f; }; f'
run:
	docker container run --rm --interactive  \
	  --tty \
	  --name nvim \
	  --mount type=bind,source="$(PRJSRC)",target="/src" \
	  $(IMAGE)
.PHONY: run

diff:
	colordiff -r ~/.config/nvim/. nvim

sync:
	cp -r ~/.config/nvim/. nvim
.PHONY: sync

# update the docker image
update:
	docker pull $(IMAGE)
.PHONY: build

# build the docker image
build:
	docker build -t $(IMAGE) --build-arg COMMIT=$(shell git describe --always) .
.PHONY: build
