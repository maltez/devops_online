dind_tag=nmurzin/dind
dind_name=nmurzin-dind
app_tag=nmurzin/phpinfo-app
app_name=phpinfo_app
dir=${CURDIR}

build:
	docker build -t $(dind_tag) .

run:
	docker run --name $(dind_name) -it -v /var/run/docker.sock:/var/run/docker.sock -v "$(dir)/app":/app $(dind_tag)

run-app:
	docker exec -i nmurzin-dind sh <<< "docker run -d --name $(app_name) -p8080:8080 -t $(app_tag)"

build-app:
	docker exec -i nmurzin-dind sh <<< "docker build -t $(app_tag) ."