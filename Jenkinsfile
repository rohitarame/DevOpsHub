pipeline {
    agent any

    options {
        timestamps()
        skipDefaultCheckout(true)
    }

    environment {
        IMAGE_TAG = "${env.BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Frontend') {
            steps {
                dir('frontend') {
                    sh 'npm install'
                    sh 'npm run build'
                }
            }
        }

        stage('Build Backend') {
            steps {
                dir('backend') {
                    sh 'mvn clean package -DskipTests'
                }
            }
        }

        stage('Docker Build') {
            steps {
                sh 'docker build -t devopshub:${IMAGE_TAG} .'
            }
        }

        stage('Deploy') {
            steps {
                sh 'kubectl apply -f k8s/'
                sh 'kubectl get pods -n devopshub'
                sh 'kubectl get services -n devopshub'
            }
        }
    }

    post {
        success {
            echo 'Simple Jenkins pipeline completed successfully.'
        }
        failure {
            echo 'Simple Jenkins pipeline failed.'
        }
    }
}