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
        BRANCH_NAME = "${GIT_BRANCH.split("/")[1]}"
    }
    stages{
        stage('Init'){
            steps{
                script{
                    echo "Intializing the pipeline variables"
                    def branchWithPrefix = env.GIT_BRANCH ?: 'master'

                    // Extract the branch name without the "origin/" prefix
                    def branchName = branchWithPrefix.replaceAll(/^origin\//, '')

                    // Check the branch name and set DEPLOY_TO variable
                    if (branchName == 'main') {
                        DEPLOY_TO = 'PRD'
                    } else if (branchName == 'develop') {
                        DEPLOY_TO = 'DEV'
                    } else if (branchName.startsWith('feature')) {
                        DEPLOY_TO = 'DEV'
                    }
                      else {
                        DEPLOY_TO = 'UAT'
                    }

                    // Print the branch name and DEPLOY_TO value
                    echo "Branch Name without prefix: ${branchName}"
                    echo "Deploy To: ${DEPLOY_TO}"
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
