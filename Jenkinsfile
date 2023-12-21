pipeline {
    agent any
    
    tools {
       maven 'maven3'
       jfrog 'jfrog-cli'
    }
    environment {
        PROJECT = "Alpha"
        PROJECT_KEY = "alpha"
        DEPLOYMENT_TYPE = "Developement"
    }

    stages {
        stage('Build') {
            steps {
               jf 'mvn-config --repo-resolve-releases alpha-maven-remote --repo-resolve-snapshots alpha-maven-remote-snaps --repo-deploy-releases alpha-maven-releases --repo-deploy-snapshots alpha-maven-snapshot '
               jf 'mvn clean install'
            }
        }

        stage('Deploy to Artifactory') {
          steps {
              jf "rt u target/*.jar alpha-maven-releases --build-name demo --build-number ${env.BUILD_NUMBER}" 
              // jf "rt bce demo --project alpha"
              jf "rt build-publish demo ${env.BUILD_NUMBER} --project alpha"

          }
        }
    }
}

