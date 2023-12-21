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
              jf "rt build-publish module1 ${env.BUILD_NUMBER} --project alpha"
              jf "rt u target/*.jar alpha-maven-releases --build-name MODULE1 --build-number ${env.BUILD_NUMBER}" 
	      jf 'rt build-publish'
              jf "rt bce MODULE1"
          }
        }
    }
}

