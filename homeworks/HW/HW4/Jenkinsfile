pipeline {
  environment {
    registry = "m3m3/docker-test"
    registryCredential = 'dockerhub'
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/Mihailov-SA/test_jenkins.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Push image to registry'){
        steps{
            script{
            docker.withRegistry( '', registryCredential ) {
                                                            dockerImage.push()
                    }
                }
            }
        }
    }
}
