pipeline {
    agent any

    environment {
        // Define any environment variables here if needed
        DOCKER_IMAGE = 'weatherapp:latest'
    }

    stages {
        stage('Check Docker') {
            steps {
                echo '🔍 Checking if Docker is accessible...'
                sh 'where docker || echo Docker NOT found'
                sh 'docker --version || echo Docker CLI not working'
            }
        }

        stage('Clone Repository') {
            steps {
                echo 'Cloning GitHub repository...'
                git branch: 'main', url: 'https://github.com/Pratyush-Agarwal6/WeatherApp.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image for WeatherApp...'
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Push Docker Image') {
            steps {
                echo 'Pushing Docker image...'
                // Uncomment and replace the following lines with your DockerHub login and push commands
                // withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                //     sh "docker login -u $DOCKER_USER -p $DOCKER_PASS"
                //     sh "docker push $DOCKER_IMAGE"
                // }
            }
        }

        stage('Deploy WeatherApp to Kubernetes') {
            steps {
                echo 'Deploying WeatherApp to Kubernetes...'
                // Ensure kubectl is configured on Jenkins and kubeconfig is available
                sh 'kubectl apply -f k8s/deployment.yaml'
            }
        }

        stage('Verify Deployment') {
            steps {
                echo 'Verifying Kubernetes Deployment...'
                // Wait for the deployment to complete
                sh 'kubectl rollout status deployment/weatherapp'
            }
        }
    }

    post {
        failure {
            echo '❌ Deployment failed.'
        }

        success {
            echo '✅ Deployment successful.'
        }
    }
}
