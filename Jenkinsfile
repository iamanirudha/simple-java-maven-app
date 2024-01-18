pipeline {
    agent any 

    tools{
         maven 'maven3'
         jfrog 'jfrog-cli'
    }
    environment{
        PROJECT = ""
        PROJECT_KEY = ""
        RELEASES_REPO = ""
        SNAPSHOT_REPO = ""
    }
    stages{
        stage('Init'){
            steps{
                script{
                    echo "Intializing the pipeline variables"
                    env.DEPLOYMENT_TYPE = "Development"
                    sh "export"
                    echo "Branch is ${branchName}"
                }
            }
        }

        stage('Build artifacts'){
            when{
              expression { env.GIT_BRANCH ==~ /(origin\/feature.*|main)/ }
            }
            steps{
                script{
                    echo "Building the artifacts ...."
                }
            }
        }
    }
}
