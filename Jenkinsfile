pipeline {
    agent any
    
    tools {
       maven 'maven3'
       jfrog 'jfrog-cli'
    }

    stages {
        stage('Build') {
            steps {
               jf 'mvn-config  --repo-deploy-releases alpha-maven-releases --repo-deploy-snapshots alpha-maven-snapshot --repo-resolve-releases=alpha-maven-remote --repo-resolve-snapshots=alpha-maven-snapshot-remote'
               jf 'mvn clean install'
            }
        }

        stage('Deploy to Artifactory') {
          steps {
             sh "echo Deploy to Jfrog"
          }
        }
    }
}

