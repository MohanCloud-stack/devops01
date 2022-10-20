pipeline {
  environment {
    registry = "devopsmohan/mernapp"
    registryCredential = '@@##$$%%Alpha8727'
    dockerImage = ''
  }

withCredentials([gitUsernamePassword(credentialsId: 'ae8c5da9-acc2-4934-96c5-d770aa0cc442', gitToolName: 'git-tool')]) {
  sh 'git fetch --all'
}
  agent any
  stages {
    stage('CloningGit') {
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