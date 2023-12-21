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
                    sh 'jfrog rt mvn-config --repo-resolve-releases alpha-maven-remote --repo-resolve-snapshots alpha-maven-remote-snaps --repo-deploy-releases alpha-maven-releases --repo-deploy-snapshots alpha-maven-snapshot'

                    // Build the project
                    sh 'mvn clean install'

                    // Collect build environment
                    sh "jfrog rt bce --build-name=${env.PROJECT_KEY} --build-number=${env.BUILD_NUMBER}"

                    // Publish the build information
                    sh "jfrog rt build-publish --build-name=${env.PROJECT_KEY} --build-number=${env.BUILD_NUMBER}"
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
