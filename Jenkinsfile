pipeline {
    agent any
    
    tools {
       maven 'maven3'
       jfrog 'jfrog-cli'
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
          }
        }
    }
}

