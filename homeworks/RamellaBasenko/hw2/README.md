#build image
docker build --tag my_jenkins:latest .

#Run container using created image
docker run -d -p 0.0.0.0:8080:8080 -p 0.0.0.0:50000:50000  -v /var/run/docker.sock:/var/run/docker.sock --name Jenkins <image name>

Jenkins will be listening port 8080 and can be reached on localhost:8080/
