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
                script {
              def mavenHome = tool name: 'maven3'
              sh "${mavenHome}/bin/mvn clean package"
            }
            }
        }

        stage('Deploy to Artifactory') {
          steps {
              script {
                   def mavenHome = tool name: 'maven3'

                sh "${mavenHome}/bin/mvn jar:jar deploy:deploy"
              }
          }
      }

    }
}
