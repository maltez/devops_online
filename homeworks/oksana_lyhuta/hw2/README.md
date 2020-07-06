[![assistant: Elegant Git](https://img.shields.io/badge/assistant-Elegant%20Git-000000.svg)](https://github.com/bees-hive/elegant-git)
### Docker in Docker set up (Jenkins)

- docker build -t jenkins .
- docker run -d -p 8080:8080 -p 50000:50000 -v /your_home:/var/jenkins_home -v /var/run/docker.sock:/var/run/docker.sock jenkins


![Jenkins](jenkins.png)