# Jenkins-DinD
  
  - Install Docker software https://www.docker.com/get-started
  - Download or clone this project and go to its source folder
  - Run command:
      - docker build --no-cache -t lazyk/jenkins-dind:lts .
      - docker run -d -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock lazyk/jenkins-dind:lts
  - Jenkins will listen on port 8080 
  - Jenkins will be able to launch docker containers as agents
  - Enjoy!
  