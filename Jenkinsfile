pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                script {
                    // Read the Maven POM file
                    def pom = readMavenPom file: 'pom.xml'

                    // Retrieve the version of the EPSCORE artifact
                    def epscoreVersion = pom.dependencies.find { it.artifactId == 'junit-jupiter-api' }?.version

                    echo "Version of junit-jupiter-api: ${epscoreVersion}"
                }
            }
        }
    }
}
