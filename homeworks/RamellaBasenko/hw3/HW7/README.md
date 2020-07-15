You must install vault cli first via:

wget https://releases.hashicorp.com/vault/1.4.3/vault_1.4.3_linux_amd64.zip && unzip vault_1.4.3_linux_amd64.zip -d /usr/bin/ && chmod +x /usr/bin/vault


Starting VAULT:

docker-compose up -d


Build app with argument as password from vault:

npm i

docker build --build-arg PASSWD=$(./get_key.sh) -t hw7 .


Starting app:

docker run --name hw7 -d -p 8080:8080 hw7


Testing:

docker exec hw7 /bin/sh -c "env | grep PASS"
