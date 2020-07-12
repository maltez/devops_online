tag=nmurzin/phpinfo-app

build:
	docker build -t $(tag) .

run:
	docker run -p8080:8080 -t $(tag)

stop:
	docker stop $$(docker ps -a -q --filter ancestor=$(tag))


