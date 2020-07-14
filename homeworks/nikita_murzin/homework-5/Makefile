dir=${CURDIR}

tf:
	docker run -it --rm --env-file=.env -v $(dir):/data nmurzin/tf-docker $$cmd

tf-build:
	docker build -t nmurzin/tf-docker .

env:
	cp ./.env.example ./.env