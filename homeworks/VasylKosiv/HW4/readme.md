1.Use Dockerfile  for running Docker in Jenkins container:
    
    - docker build -t jenkins-docker
    - docker run -dp 8080:8080 jenkins-docker


2. Install plugins docker and docker pipline

3. Create credential as secret text for docker hub 

2. In Jenkins create pipline from 
    
    - https://github.com/VasylKosiv/test.git
 
 Jenkinsfile is their
