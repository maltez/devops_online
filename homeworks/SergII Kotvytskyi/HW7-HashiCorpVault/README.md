# HashiCorp Vault
  
- Install Vault software https://learn.hashicorp.com/vault/getting-started/install
- First, start a Vault dev server. The dev server is a built-in, pre-configured server that is not very secure but useful for playing with Vault locally: vault server -dev
- Launch a new terminal session and run the command: export VAULT_ADDR='http://127.0.0.1:8200' This will configure the Vault client to talk to the dev server
- Set the VAULT_DEV_ROOT_TOKEN_ID environment variable value to the generated Root Token value displayed in the terminal output: export VAULT_DEV_ROOT_TOKEN_ID="your_dev_root_token_id". Setting this environment variable is a way to provide the token to Vault. You started the dev server and exported the VAULT_DEV_ROOT_TOKEN_ID to the initial root token value so that Vault login is not required to authenticate.
- Writing a Secret for mysql database. Run command: vault kv put -address=http://127.0.0.1:8200 secret/db mysql=$RANDOM
- Now create a docker image and pass the MySQL password from Vault as an environment variable: docker build --build-arg PASSWORD=$(vault kv get -address=http://127.0.0.1:8200 -field="mysql" secret/db) --no-cache -t lazyk/simple-bash-webserver:latest .
- Start the docker container from the created image: docker run --name sbws -p 8080:8080 lazyk/simple-bash-webserver:latest
- Follow the link http://localhost:8080 and you can see the MySQL password on the web page
- Enjoy!
