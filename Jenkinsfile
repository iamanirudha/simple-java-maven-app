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
                sh "export"
                sh "echo Initialization step"
            }
        }

        stage('Build artifacts'){
            when{
                anyOf{
                    branch 'feature-*'
                    branch 'master'
                }
            }
            steps{
                script{
                    echo "Building the artifacts ...."
                }
            }
        }
    }
}
