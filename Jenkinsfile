pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                echo "Cloning repository..."
                git branch: 'main', url: 'https://github.com/Pratyush-Agarwal6/WeatherApp.git'
            }
        }

        stage('Build') {
            steps {
                echo "Building the WeatherApp..."
                sh 'docker build -t weather-app:latest .'
            }
        }

        stage('Test') {
            steps {
                echo "Running tests..."
                sh 'echo "No tests defined yet!"'
            }
        }

        stage('Deploy Existing Docker Container') {
            steps {
                echo "Deploying WeatherApp..."
                sh '''
                if docker ps -q --filter "name=my-weather-app" | grep -q .; then
                    echo "Stopping and removing existing container..."
                    docker stop my-weather-app
                    docker rm my-weather-app
                fi
                
                echo "Starting new container..."
                docker run -d --name my-weather-app -p 8080:80 weather-app:latest
                '''
            }
        }
    }
}
