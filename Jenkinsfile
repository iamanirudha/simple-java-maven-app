pipeline {
    agent any

    tools {
        maven 'maven3'
        jfrog 'jf'
    }

    environment {
        PROJECT = "Delta"
        RELEASES_REPO = "poc-repo"
        SNAPSHOT_REPO = "poc-snap"
        ARTIFACT_ID = readMavenPom().getArtifactId()
        VERSION = readMavenPom().getVersion()
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Configure Maven settings 
                    echo "${ARTIFACT_ID} ${VERSION}"
                    sh "chmod 755 scripts/init.sh"
                    sh "./scripts/init.sh"
                    

                }
            }
        }

        stage('Deploy to Artifactory') {
            steps {
                script {
                    // Deployment steps go here
                    echo 'Deploying to Artifactory...'
                    jf "mvn clean install"
                }
            }
        }
    }
}
