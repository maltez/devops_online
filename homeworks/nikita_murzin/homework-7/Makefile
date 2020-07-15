tag=nmurzin/phpinfo-app

build:
	docker build -t $(tag) .

run:
	docker run -p 8080:8080 -e "SECRETS=$$(vault kv get -format=json secret/phpinfo-app)" -t $(tag)

stop:
	docker stop $$(docker ps -a -q --filter ancestor=$(tag))



