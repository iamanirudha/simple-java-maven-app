pipeline {
    agent any 

    tools{
         maven 'maven3'
         jfrog 'jfrog-cli'
         // java  'jdk8'
    }
    /*
    DO NOT CHANGE UNLESS YOU KNOW WHAT YOU ARE DOING.
    */
    environment{
        PROJECT = ""
        PROJECT_KEY = ""
        RELEASES_REPO = ""
        SNAPSHOT_REPO = ""
    }
    stages{
        /*
        This is a Initialization stage, we use this for setting up the Environment variables
        that will be used in the pipeline for conditional checks.
        */
        stage('Init'){
            steps{
                script{
                    echo "setup Intial environment"
                }
            }
        }

        stage("Install 3rd party jar"){
            when{
                expression {
                    env.GIT_BRANCH ==~ /(origin\/feature.*|origin\/develop)/
                }
            }
            steps{
                sh "echo Downloading the jar"
                sh "echo mvn install:install-file"
            }
        }

        stage('Build artifacts'){
            when{
                expression {
                    env.GIT_BRANCH ==~ /(origin\/feature.*|origin\/develop)/
                }
            }
            steps{
                script{
                    echo "mvn -f pom.xml clean install"
                    echo "upload artifact to Jfrog repo"
                }
            }
        }

        stage('Publish'){
            when{
                expression {
                    env.GIT_BRANCH ==~ /(origin\/develop)/
                }
            }
            steps{
                sh "echo build-publish"
                sh "echo Create release bundle"
                sh "echo protmote to UAT"
            }
        }

        stage('Sonar scan'){
            when{
                expression {
                    env.GIT_BRANCH ==~ /(origin\/feature.*|origin\/develop)/
                }
            }
            steps{
                sh "echo mvn"
            }    
        }

        stage('Deploy to DEV'){
            when{
                expression {
                    env.GIT_BRANCH ==~ /(origin\/feature.*|origin\/develop)/
                }
            }
            steps{
                sh "echo Deploy to DEV"
            }
        }

        stage('Deploy to UAT'){
            when{
                expression {
                    env.GIT_BRANCH ==~ /(origin\/uat)/
                }
            }
            steps{
                sh "echo Deploy to UAT"
            }
        }

        stage('Deploy to PROD'){
            when{
                expression {
                    env.GIT_BRANCH ==~ /(origin\/prod)/
                }
            }
            steps{
                sh "echo Deploy to PROD"
            }
        }
    }
}
