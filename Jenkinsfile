pipeline {
    agent any
    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', credentialsId: 'github-creds', url: 'https://github.com/YourUsername/WeatherApp.git'
            }
        }
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t weather-app .'
            }
        }
        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p 8080:80 weather-app'
            }
        }
    }
}
