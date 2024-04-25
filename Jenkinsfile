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
                    jf 'mvn-config --repo-deploy-releases charlie-libs-release-local --repo-deploy-snapshots charlie-libs-release-local'

                    // Build the project
                    jf "mvn clean install --build-name ${env.PROJECT} --build-number ${env.BUILD_NUMBER}"

                    

                    // Collect build environment 
                    jf "rt bce ${env.PROJECT} ${env.BUILD_NUMBER} "

                    // Publish the build information --project ${env.PROJECT_KEY}
                    jf "rt build-publish ${env.PROJECT} ${env.BUILD_NUMBER}"

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
