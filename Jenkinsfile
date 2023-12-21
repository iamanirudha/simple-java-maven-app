pipeline {
    agent any
    
    tools {
       maven 'maven3'
       jfrog 'jfrog-cli'
    }

    stages {
        stage('Build') {
            jf 'mvn-config  --repo-deploy-releases alpha-maven-releases --repo-deploy-snapshots alpha-maven-releases --repo-resolve-releases --repo-resolve-releases=alpha-maven-remote --repo-resolve-snapshots=alpha-maven-snapshot-remote'
            jf 'mvn clean install'
            }

        stage('Deploy to Artifactory') {
          steps {
             sh "echo Deploy to Jfrog"
          }
        }
    }
}

