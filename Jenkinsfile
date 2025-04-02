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
                rmdir /s /q C:\\nginx\\html
                mkdir C:\\nginx\\html
                xcopy /E /I *.html C:\\nginx\\html\\
                xcopy /E /I *.css C:\\nginx\\html\\
                xcopy /E /I *.js C:\\nginx\\html\\
                xcopy /E /I *.jpg C:\\nginx\\html\\
                '''
            }
        }
    }
}
