pipeline {
    agent any

    tools {
        maven 'maven3'
        jfrog 'jfrog-cli'
    }

    environment {
        PROJECT = "Alpha"
        PROJECT_KEY = "alpha"
        DEPLOYMENT_TYPE = "Development"
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Configure Maven settings
                    jf 'mvn-config --repo-resolve-releases alpha-maven-remote --repo-resolve-snapshots alpha-maven-remote-snaps --repo-deploy-releases alpha-build-info --repo-deploy-snapshots alpha-build-info'

                    // Build the project
                    jf 'mvn clean install'

                    // Collect build environment
                    jf "rt bce ${env.PROJECT} ${env.BUILD_NUMBER} --project ${env.PROJECT_KEY}"

                    // Publish the build information
                    jf "rt build-publish ${env.PROJECT} ${env.BUILD_NUMBER} --project ${env.PROJECT_KEY}"
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
