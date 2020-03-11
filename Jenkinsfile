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

    stage('Hello AWS') {
      steps {
        withAWS(region: 'us-west-2', credentials: 'aws-static') {
          echo 'Success'
          sh 'kubectl config get-contexts'
          sh 'kubectl config use-context iam-root-account@extravagant-creature-1583880539.us-west-2.eksctl.io'
          sh 'kubectl apply -f blue_controller.json'
          sh 'kubectl apply -f blue_green_service.json'
        }

      }
    }

    stage('Apply K8 File') {
      steps {
        echo 'Success'
      }
    }

    stage('Remove Unused docker image') {
      steps {
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }

  }
  environment {
    registry = 'rradi/udacity_devops_capstone_project'
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
}