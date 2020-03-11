pipeline {
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/rradi/udacity_devops_capstone_project.git'
      }
    }

    stage('Linting HTML') {
      steps {
        echo 'Linting Now...'
        sh 'hostname'
        sh 'tidy -q -e *.html'
      }
    }

    stage('Build Docker Image') {
      steps {
        echo 'Building...'
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }

      }
    }

    stage('Deploy Image') {
      steps {
        echo 'Pushing Image...'
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("latest")
          }
        }

      }
    }

  }
  environment {
    registry = 'rradi/udacity_devops_capstone_project'
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
}