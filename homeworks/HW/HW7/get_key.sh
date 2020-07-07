#!/bin/bash
#export VAULT_ADDR=http://127.0.0.1:8200
#openssl rand -base64 32
./vault_cli login -address=http://127.0.0.1:8200 -no-print token=root
./vault_cli kv put -address=http://127.0.0.1:8200 secret/key0 key0-1=$(openssl rand -base64 32) > /dev/null

./vault_cli kv get -address=http://127.0.0.1:8200 -field="key0-1" secret/key0
