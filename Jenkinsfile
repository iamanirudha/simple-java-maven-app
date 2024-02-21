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
    }

    stages {
        stage('Build') {
            steps {
                script {
                    // Configure Maven settings 
                    jf 'mvn-config --repo-deploy-releases delta-releases-repo --repo-deploy-snapshots delta-snapshot-repo --repo-resolve-releases delta-virtual-repo  --repo-resolve-snapshots  delta-virtual-repo'

                    // Build the project
                    jf "mvn clean install --build-name ${env.PROJECT} --build-number ${env.BUILD_NUMBER} --project  ${env.PROJECT_KEY}"

                    

                    jf "rt sp target/*.jar checksum=1234m"

                    // jf "rt u target/*.jar delta-releases-repo --build-name ${env.PROJECT} --build-number ${env.BUILD_NUMBER}"

                    // Collect build environment 
                    jf "rt bce ${env.PROJECT} ${env.BUILD_NUMBER} --project ${env.PROJECT_KEY}"

                    // Publish the build information --project ${env.PROJECT_KEY}
                    jf "rt build-publish ${env.PROJECT} ${env.BUILD_NUMBER} --project ${env.PROJECT_KEY}"

                    // Promote the build to DEV and create Release Bundle.
                    // jf "rt dl delta-prod-releases/com/mycompany/app/my-app/1.3/my-app-1.3.jar ."
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
