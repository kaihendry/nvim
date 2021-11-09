PRJSRC=$(shell pwd)
IMAGE=hendry/js-nvim

# alias je='f(){ docker run -it --rm -v $(pwd):/proj hendry/js-nvim; unset -f f; }; f'
run:
	docker container run --rm --interactive  \
	  --tty \
	  --name js-nvim \
	  --mount type=bind,source="$(PRJSRC)",target="/src" \
	  $(IMAGE)
.PHONY: run

# update the docker image
update:
	docker pull $(IMAGE)
.PHONY: build

# build the docker image
build:
	docker build -t $(IMAGE) .
.PHONY: build
