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
                    jf 'mvn-config --repo-resolve-releases alpha-maven-remote --repo-resolve-snapshots alpha-maven-remote-snaps --repo-deploy-releases alpha-maven-releases --repo-deploy-snapshots alpha-maven-snapshot'

                    // Build the project
                    jf 'mvn clean install'

                    jf "rt u target/*.jar alpha-build-info ${env.PROJECT} ${env.BUILD_NUMBER}"

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
