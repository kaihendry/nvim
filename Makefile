PROJDIR=$(shell pwd)
IMAGE=hendry/js-nvim

# run goide in present working directory
run:
	docker container run --rm --interactive  \
	  --tty \
	  --name js-nvim \
	  --mount type=bind,source="$(PROJDIR)",target="/proj" \
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
