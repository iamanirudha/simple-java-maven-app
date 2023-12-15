pipeline {
    agent any
    
    tools {
    maven 'maven3'
    jfrog 'jfrog-cli'

}
    environment {
        ARTIFACTORY_CREDENTIALS_ID = credentials('jfrog-token')
    }

    stages {
        stage('Hello') {
            steps {
              script {
                    def mavenHome = tool name: 'maven3'
                    sh "${mavenHome}/bin/mvn --version"
                    def jfrogCliTool = tool name: 'jfrog-cli'
                    sh "${jfrogCliTool}/jf --version"
                    env.MY_VAR = "foo"
                }
            }
        }
        stage('Build') {
            steps {
              sh "${mavenHome}/bin/mvn clean package"
            }
        }

        stage('Deploy to Artifactory') {
          steps {
              script {
 
                  sh "${jfrogCliTool}/jf rt config --url=http://172.17.0.2:8081/artifactory --user=admin --apikey=${ARTIFACTORY_CREDENTIALS_ID} --interactive=false"

                  // Deploy the Maven artifact using JFrog CLI
                  // sh "jfrog rt mvn ${ARTIFACTORY_REPO}/ --build-name=my-build --build-number=1 target/*.jar"
                sh "${mavenHome}/bin/mvn deploy"
              }
          }
      }

    }
}
