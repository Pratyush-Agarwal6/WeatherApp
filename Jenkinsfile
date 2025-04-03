pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                echo 'Cloning repository...'
                git branch: 'main', url: 'https://github.com/Pratyush-Agarwal6/WeatherApp.git'
            }
        }

        stage('Deploy to NGINX') {
            steps {
                echo 'Deploying WeatherApp to NGINX...'
                bat '''
                rmdir /s /q C:\\nginx\\nginx-1.27.4\\html\\WeatherApp
                mkdir C:\\nginx\\nginx-1.27.4\\html\\WeatherApp
                xcopy /E /I Weather-main\\* C:\\nginx\\nginx-1.27.4\\html\\WeatherApp\\
                '''
            }
        }
    }
}
