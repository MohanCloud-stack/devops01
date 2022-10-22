pipeline {
  environment {
    registry ='devopsmohan/mernapp1'
    registryCredential ='devopsmohan'
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
         sh 'docker build -t mernapp1 .'
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
