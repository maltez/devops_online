dir=${CURDIR}
tag=nmurzin/tf-docker

tf:
	docker run -it --rm --env-file=.env -v $(dir):/data $(tag) $$cmd

tf-build:
	docker build -t $(tag) .

env:
	cp ./.env.example ./.env