pipeline {
  environment {
    registry = "devopsmohan/mernapp"
    registryCredential = "@@##$$%%Alpha8727"
    dockerImage = ''
  }
 agent any
 
  stages {
    stage('Cloning Git') {
      steps {
        git branch: 'main', credentialsId: 'a3e81212-a3f5-45de-9b8e-cc86d8437a2d', url: 'https://github.com/MohanCloud-stack/devops01.git'
      }
    }
    stage('Build') {
       steps {
         sh ' sudo  docker build -t mernapp .'
       }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
         script {
            docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
  }
}