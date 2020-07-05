HW1:
![Alt text](HW2.jpg?raw=true "Title")

## Build customized Image
1. Docker build container vith docker and utilities
```
docker build -t kutsegor/docker:latest .
```

2. Run docker container using docker.sock inside of container
(Original article: http://jpetazzo.github.io/2015/09/03/do-not-use-docker-in-docker-for-ci/#:~:text=And%20the%20simplest%20way%20is,%3A%2Fvar%2Frun%2Fdocker.)

```
docker run -v /var/run/docker.sock:/var/run/docker.sock -it kutsegor/docker:latest
```
or run Run docker container using docker.sock inside of container and mount dockerfiles folder with prepared Dockerfiles:
(make sure that you located in the root HW project)
```
docker run --name ekuts_docker \
           -v /var/run/docker.sock:/var/run/docker.sock \
           -v "$(pwd)/dockerfiles":/dockerfiles \
           -it kutsegor/docker:latest
```

3. Build container inside of the docker:
```
docker exec -i ekuts_docker sh <<< "docker build -f Python.Dockerfile -t kutsegor/python_server ."

```

4. Run Python simple paje inside of the docker:
```
docker exec -i ekuts_docker sh <<< "docker run -d --network host --name python_server -t kutsegor/python_server "
```

5. Check connectios in the real time:
```
docker logs -f python_server
```

6. Open python app in your browser:
```
http://0.0.0.0:7001/
```

7. Login inside to container if you needed:
```
docker exec -it ekuts_docker sh
```
