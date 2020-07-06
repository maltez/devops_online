[![assistant: Elegant Git](https://img.shields.io/badge/assistant-Elegant%20Git-000000.svg)](https://github.com/bees-hive/elegant-git)

### Access secret data stored in your local Hashicorp Vault from a Docker Container

##### Your container should be configured to use 3rd party Docker Volume Driver - [LibSecret](https://github.com/ehazlett/docker-volume-libsecret). The Volume Driver communicates with Vault (so the applications don't require any additional configuration to access the secret data). 
##### Example: create some data via CLI
  vault write -address=${VAULT_ADDR} secret/app/info value=secretinfo
##### The plugin is required to run as a background job on the Docker host. 
  nohup docker-volume-libsecret 
    --addr $VAULT_ADDR 
    --backend vault 
    --store-opt token=$VAULT_TOKEN </dev/null &> libsecretlogs &
##### Start your container with --volume-driver parameter (we map a Vault collection to a file-system folder: secret/app in Vault to a folder /secrets in the app)
  docker run -ti --rm 
    --volume-driver libsecret 
    -v secret/app/:/secrets 
    -p 8083:8083 
    hello-world /bin/sh
##### Everything is managed via the Volume Driver. The container now has read access to all the keys in the app collection. Each key within our collection is accessed as a file. Example: to read value of /app/info we'd just read the file:
   cat secrets/secretinfo
##### And then you can pass this valuse to any variable that you would like.
##### The Volume Driver only provides read/list access to Vault.
