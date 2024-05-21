pipeline {
    agent any 

    tools{
         maven 'maven3'
         jfrog 'jfrog-cli'
    }
    environment {
        PROJECT = "ALPHA"
    }

    stages{
        stage('Init'){
            steps{
                script{
                    sh "chmod 755 scripts/init.sh"
                    sh "./scripts/init.sh"

                    sh ". ./dotenv && echo $MAVEN_DEPLOY_REPO"
                    



                    sh "export"
                }
            }
        }

        stage('Build artifacts'){

            steps{
                script{
                    sh '. ./dotenv'
                    echo "Building the artifacts for ${MAVEN_DEPLOY_REPO} ...."
                }
            }
        }
    }
}
