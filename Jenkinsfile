pipeline {
  agent any

  environment {
    DOCKERHUB_CREDENTIALS = credentials('dockerhub')
  }

  stages {
    stage('Clone Repository') {
      steps {
        git branch: 'main', url: 'https://github.com/Bose2001/trend-deployment.git'
      }
    }


    stage('Build Docker Image') {
      steps {
        sh 'docker build -t bose25/trend-react .'
      }
    }

    stage('Push to DockerHub') {
      steps {
        withCredentials([usernamePassword(credentialsId: 'dockerhub', usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
          sh '''
            echo "$PASSWORD" | docker login -u "$USERNAME" --password-stdin
            docker push bose25/trend-react
          '''
        }
      }
    }

    stage('Configure Kubeconfig') {
  steps {
    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'aws-credentials']]) {
      sh 'aws eks --region us-east-1 update-kubeconfig --name trend-cluster'
    }
  }
}


    stage('Deploy to Kubernetes') {
      steps {
        sh '''
          kubectl apply -f deployment.yaml
          kubectl apply -f service.yaml
        '''
      }
    }
  }
}
