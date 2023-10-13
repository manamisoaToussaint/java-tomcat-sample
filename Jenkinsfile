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

        stage('Create Tomcat Docker Image') {
            steps {
                //mention the command which need to run to create the image
                sh 'docker build . -t tomcatsamplewebapp:${env.BUILD_ID}'
                //execute this particular command at the current directory
                // - t pour tag l'image (image name)
                // version eto ataotsika ny build nomber
                //mapiasa variable d'env disponible am jenkins

            }
        }
        
    }
}