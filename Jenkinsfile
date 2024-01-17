pipeline {
    agent any

    tools {
        maven 'maven3'
        jfrog 'jfrog-cli'
    }

    environment {
        PROJECT = "Delta"
        PROJECT_KEY = "delta"
        DEPLOYMENT_TYPE = "Development"
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Configure Maven settings 
                    // jf 'mvn-config --repo-deploy-releases delta-releases-repo --repo-deploy-snapshots delta-snapshot-repo --repo-resolve-releases delta-remote-repo  --repo-resolve-snapshots  delta-remote-repo'

                    // Build the project
                    jf 'mvn clean install'

                    jf "rt u target/*.jar delta-releases-repo --build-name ${env.PROJECT} --build-number ${env.BUILD_NUMBER}"

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
