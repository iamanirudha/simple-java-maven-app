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
                    def branchName = (env.GIT_BRANCH =~ /origin\/(.*)/ ? env.GIT_BRANCH[1] : 'master').trim()
                    env.BRANCH_NAME = branchName 
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
