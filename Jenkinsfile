pipeline {
    agent any 

    tools{
         maven 'maven3'
         jfrog 'jfrog-cli'
    }

    stages{
        stage('Init'){
            steps{
                script{
                    sh "chmod 755 scripts/init.sh"
                    sh "./scripts/init.sh"

                    sh '. ./dotenv'

                    env.DEPLOY_REPO = "$MAVEN_DEPLOY_REPO"
                    env.RESOLVE_REPO = "$MAVEN_RESOLVE_REPO"

                    sh "export"
                }
            }
        }

        stage('Build artifacts'){

            steps{
                script{
                    
                    echo "Building the artifacts for ${env.DEPLOY_REPO} ...."
                }
            }
        }
    }
}
