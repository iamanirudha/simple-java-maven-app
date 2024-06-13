pipeline {
    agent any
    tools {
        maven 'maven3'
    }

    stages {
        stage('Build') {
            when {
                branch 'dev'
                }
            steps {
                // Your build steps here
                echo "Building branch ${env.GIT_BRANCH}"
            }
        }

        stage('Deploy to UAT') {
            when {
                branch 'uat'
                not {
                    triggeredBy 'UserIdCause'
                }
            }
            steps {
                input message: "Deploy to UAT?", ok: "Deploy"
                echo "Deploying to UAT environment"
                // Your UAT deployment steps here
            }
        }
        stage('Deploy to PROD') {
            when {
                branch 'prod'
                not {
                    triggeredBy 'UserIdCause'
                }
            }
            steps {
                input message: "Deploy to PROD?", ok: "Deploy"
                echo "Deploying to PROD environment"
                // Your PROD deployment steps here
            }
        }
    }
}
