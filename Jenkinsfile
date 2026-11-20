pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                bat 'python -m venv venv'
                bat 'venv\\Scripts\\python.exe -m pip install --upgrade pip'
                bat 'venv\\Scripts\\python.exe -m pip install -r requirements.txt'
            }
        }

        stage('Test') {
            steps {
                bat 'venv\\Scripts\\python.exe -m pytest -v'
            }
        }

        stage('Deploy') {
            steps {
                bat 'if not exist deployment mkdir deployment'
                bat 'copy /Y app.py deployment\\app.py'
                bat 'copy /Y requirements.txt deployment\\requirements.txt'
                bat 'dir /B deployment'
            }
        }
    }
}
