pipeline {
    agent any
    
    tools {
    maven 'maven3'
    jfrog 'jfrog-cli'

}
    // environment {
    //     ARTIFACTORY_CREDENTIALS_ID = credentials('jfrog-token')
    // }

    stages {
        stage('Build') {
            steps {
            //     script {
            //   def mavenHome = tool name: 'maven3'
            //   sh "${mavenHome}/bin/mvn clean package"
            // }
            jf 'mvn-config  --repo-deploy-releases Aplha --repo-deploy-snapshots Apha-snapshots'
            jf 'mvn clean install'
            }
        }

        stage('Deploy to Artifactory') {
          steps {
              // jf "rt u target/*.jar Aplha/ --build-name module1 --build-number ${env.BUILD_NUMBER}"
              // jf "rt build-publish module1  ${env.BUILD_NUMBER}"
              // jf "rt bpr --copy=true module1  ${env.BUILD_NUMBER} Alpha-Prod "
              jf 'rt build-publish'
              // jf 'rt bce module1 11'
              // jf 'rt bce Devops ${env.BUILD_NUMBER}'
          }
        }
    }
}

