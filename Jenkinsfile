pipeline {
  agent any
  environment {
    registry = "devopsmohan/mernapp"
    registryCredential = '@@##$$%%Alpha8727'
    dockerImage = ''
  }
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/MohanCloud-stack/devops01.git'
      }
    }
    stage('Build') {
       steps {
         sh 'docker build -t mernapp .'
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