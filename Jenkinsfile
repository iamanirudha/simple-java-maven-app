pipeline {
    agent any
    tools {
        maven 'maven3'
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Read the version from the POM file
                    def version = sh(script: 'mvn help:evaluate -Dexpression=project.dependencies.dependency -q -DforceStdout', returnStdout: true).trim()

                    echo "Maven Project Version: ${version}"
                }
            }
        }
    }
}
