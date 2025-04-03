pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'your-dockerhub-username/react-ecommerce:latest'  // Update with your Docker Hub repo
        KUBE_DEPLOYMENT = 'react-ecommerce-deployment.yaml'
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/ssahibsingh/React_E-Commerce.git'
            }
        }

        stage('Install Dependencies & Build') {
            steps {
                script {
                    sh 'npm install'
                    sh 'npm run build'
                }
            }
        }

        stage('Docker Build & Push') {
            steps {
                script {
                    sh "docker build -t $DOCKER_IMAGE ."
                    sh "echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin"
                    sh "docker push $DOCKER_IMAGE"
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    sh "kubectl apply -f $KUBE_DEPLOYMENT"
                }
            }
        }
    }

    post {
        success {
            echo 'Deployment Successful!'
        }
        failure {
            echo 'Deployment Failed. Check the logs.'
        }
    }
}
