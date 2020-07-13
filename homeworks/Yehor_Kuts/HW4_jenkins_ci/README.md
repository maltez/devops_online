HW4:
![Alt text](HW4.jpg?raw=true "Title")

## Build and run jenkins

1. Build Jenkins
```
docker build -f ./docker/jenkins/Dockerfile -t kutsegor/server_jenkins ./docker/jenkins/
```
2. Run jenkins
```
docker run --name jenkins_server \
           -v /var/run/docker.sock:/var/run/docker.sock \
           -p8080:8080 \
           -it kutsegor/server_jenkins:latest
```
3. Install plugins:
```
Docker Pipeline
CloudBees Docker Build and Publish
```

## Configure Jenkins:
1. Add Dockerhub Credentials:
```
Jenkins --> Credentials --> Systemc --> Global Credentials
ID: dockerHub
```

2. Add new Item:
```
Jenkins --> new item --> "docker-pipline" --> pipline --> Pipline script from SCM --> Git --> Repository URL "https://github.com/LirayKH/server_python"
```
3. Add work with docker-registry
```
node {
    checkout scm

    docker.withRegistry('https://registry.hub.docker.com', 'dockerHub') {

        def customImage = docker.build("my-image:${env.BUILD_ID}")

        /* Push the container to the custom Registry */
        customImage.push()
    }
}
```
From:
```
https://www.jenkins.io/doc/book/pipeline/docker/#custom-registry
```
## Update code to github repository
1. Go to folder with python app
```
cd server_python/
```
2. Add some changes and commit it:
```
git add .
git commit -s -m "This is my commit message"
```

## Build new docker image through Jenkins

If you want to actualize docker image in the https://github.com/LirayKH/server_python repository, simple execute:
```
docker-pipline --> Build Now
```
## Work with docker-registry

1. Link to docker registry
```
https://hub.docker.com/r/kutsegor/server-python
```
2. Pull image from docker-registry
```
docker pull kutsegor/server-python
```