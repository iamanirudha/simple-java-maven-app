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
                    // Configure Maven settings --repo-deploy-releases delta-remote-repo --repo-deploy-snapshots delta-remote-snap
                    jf 'mvn-config --repo-resolve-releases releases-repo --repo-resolve-snapshots snapshot-repo'

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
