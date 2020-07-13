# Jenkins CI
  
  - Install Docker https://www.docker.com/get-started and Jenkins https://www.jenkins.io/download software
  - Register on the dockerhub https://hub.docker.com. Run Jenkins and add dockerhub credentials to  Jenkins->Credentials->System->Add Credentials: username: <your dockerhub username>, password: <your dockerhub password>, ID: dockerhub and click "Ok" 
  - Create a new pipeline and copy the contents of the docker_build.jenkins file into Pipeline-> Script field.
  - Change the environment variable “registry” from “lazyk/alpine-ping” to “<your dockerhub username>/alpine-ping” and click “Save”.
  - Go to your jenkins pipeline and click Build Now to start the process.
  - Enjoy!
  