pipeline {
    agent any

    stages {
        stage('Build Application') {
            steps {
                sh 'mvn -f pom.xml clean package'
            }
            post {
                success {
                    echo "Now Archiving the Artifact...."
                    archiveArtifacts artifacts: '**/*.war'
                }
            }
        }

        stage('Deploy in Staging Environment') {
            steps {
                build job: 'Deploy_Application_Staging_Env'
            }
        }

        stage('Deploy in Prod Environment') {
            steps {
                //deploy manualy
                timeout(time:5, unit:'DAYS') {
                    input message: 'Approve PRODUCTION Deployment?'
                }
                build job: 'Deploy_Application_PROD_Env'
            }
        }
        
    }
}