
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

                bat '''
                start "" /B "%WORKSPACE%\\venv\\Scripts\\python.exe" "%WORKSPACE%\\deployment\\app.py"
                '''
            }
        }

        stage('Post-Deployment Health Check') {
            steps {
                bat '''
                powershell -NoProfile -Command "$ok=$false; for($i=0; $i -lt 15; $i++) { try { $r=Invoke-RestMethod -Uri 'http://127.0.0.1:5000/health' -TimeoutSec 2; if($r.status -eq 'healthy') { $ok=$true; break } } catch {}; Start-Sleep -Seconds 1 }; if(-not $ok) { exit 1 }; Write-Host 'Health check passed!'"
                '''
            }
        }
    }
}
