pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    // Read the version from the POM file
                    def version = sh(script: 'mvn help:evaluate -Dexpression=project.version -q -DforceStdout', returnStdout: true).trim()

                    echo "Maven Project Version: ${version}"
                }
            }
        }
    }
}
