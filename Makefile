PRJSRC=$(shell pwd)
IMAGE=hendry/nvim

run:
	docker container run --rm --interactive  \
	  --tty \
	  --name nvim \
	  --mount type=bind,source="$(PRJSRC)",target="/src" \
	  $(IMAGE)
.PHONY: run

diff:
	diff -x plugin -ur ~/.config/nvim/ nvim

sync:
	cp -r ~/.config/nvim/. nvim
	rm -r nvim/plugin/
.PHONY: sync

# update the docker image
update:
	docker pull $(IMAGE)
.PHONY: build

# build the docker image
build:
	docker build -t $(IMAGE) --build-arg COMMIT=$(shell git describe --always) .
.PHONY: build
