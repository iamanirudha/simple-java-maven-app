pipeline {
    agent any

    tools {
        maven 'maven3'
        jfrog 'jf'
    }

    environment {
        PROJECT = "Delta"
        PROJECT_KEY = "delta"
        DEPLOYMENT_TYPE = "Development"
        RELEASES_REPO = "poc-repo"
        SNAPSHOT_REPO = "poc-snap"
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Configure Maven settings 
                    sh "chmod 755 scripts/init.sh"
                    sh "./init.sh"

                }
            }
        }

        stage('Deploy to Artifactory') {
            steps {
                script {
                    // Deployment steps go here
                    echo 'Deploying to Artifactory...'
                }
            }
        }
    }
}
