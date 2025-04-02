pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning repository...'
                git 'https://github.com/Pratyush-Agarwal6/WeatherApp.git'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the WeatherApp...'
                sh 'docker build -t weather-app:latest .'
            }
        }

        stage('Run Container') {
            steps {
                echo 'Running the WeatherApp container...'
                sh 'docker run -d -p 8080:80 --name weather-app weather-app:latest'
            }
        }
    }
}
