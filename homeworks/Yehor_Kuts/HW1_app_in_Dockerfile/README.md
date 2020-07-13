HW1:
![Alt text](HW1.jpg?raw=true "Title")

## Run container on the custom port in host network

1. Build container
```
docker build -f CustomPort.Dockerfile -t kutsegor/python_server_custom_port .
```

2. Run container on the custom port (7005 in the example). Or leave port parameter empty and run server on the default 7006 port.
```
docker run --network=host --name python_server -t kutsegor/python_server_custom_port 7005
```

3. Check URL:
```
http://127.0.0.1:7005
```

## Run container on the default port in the bridge network

1. Build container
```
docker build -f DefaultPort.Dockerfile -t kutsegor/python_server_default_port .
```

2. Run container on the default port described in the DefaultPort.Dockerfile
```
docker run --name python_server_dafault_port -p7001:7001 -t kutsegor/python_server_default_port
```

3. Check URL:
```
http://127.0.0.1:7001/
```