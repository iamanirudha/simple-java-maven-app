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
              jf "rt bce"
              jf "rt build-publish"

          }
        }
    }
}

