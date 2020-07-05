HW3:
![Alt text](HW3.jpg?raw=true "Title")

## Build and run go and python apps with docker-compose in the separated networks

1. Run 2 apps through docker-compose:
```
docker-compose up
```
## Check apps:
1. Go app:
```
http://localhost:9000/
```

2. Python app:
```
http://localhost:7001/
```

## Build and run debug containers manually
1. Go app:
```
docker build -f ./docker/go-app/Dockerfile -t kutsegor/server_go ./docker/go-app/
docker run --name server_go -p9000:9000 -t kutsegor/server_go
```

2. Python app:
```
docker build -f ./docker/py-app/Dockerfile -t kutsegor/server_python ./docker/py-app/
docker run --name server_python -p7001:7001 -t kutsegor/server_python
```



