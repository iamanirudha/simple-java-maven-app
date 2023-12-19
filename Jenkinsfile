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

        stage ('Artifactory Configuration') {
            steps {
                rtServer (
                    id: "jfrog-server",
                    url: "http://172.17.0.2:8082/artifactory",
                    credentialsId: "jfrog"
                )
 
                // rtMavenResolver (
                //     id: 'maven-resolver',
                //     serverId: 'kaloula-artifactory',
                //     releaseRepo: 'libs-release',
                //     snapshotRepo: 'libs-snapshot'
                // )  
                 
                rtMavenDeployer (
                    id: 'maven-deployer',
                    serverId: jfrog-server,
                    releaseRepo: 'Aplha',
                    snapshotRepo: 'Apha-snapshots',
                    threads: 6,
                    properties: ['BinaryPurpose=Technical-BlogPost', 'Team=DevOps-Acceleration']
                )
            }
        }
        stage('Build Maven Project') {
            steps {
                rtMavenRun (
                    tool: 'maven3',
                    pom: 'pom.xml',
                    goals: '-U clean install',
                    deployerId: "maven-deployer",
                    // resolverId: "maven-resolver"
                )
            }
        }
 
        stage('Build') {
            steps {
            //     script {
            //   def mavenHome = tool name: 'maven3'
            //   sh "${mavenHome}/bin/mvn clean package"
            // }
            // jf 'mvn-config  --repo-deploy-releases Aplha --repo-deploy-snapshots Apha-snapshots'
            // jf 'mvn clean install'
            sh "export"
            }
        }

        stage('Deploy to Artifactory') {
          steps {

              // jf "rt u target/*.jar Aplha/ --build-name module1 --build-number ${env.BUILD_NUMBER}"
              // jf "rt build-publish module1  ${env.BUILD_NUMBER}"
              // jf "rt bpr --copy=true module1  ${env.BUILD_NUMBER} Alpha-Prod "
              // jf 'rt build-publish --env-include APP_VERSION=1.0;BUILD_TYPE=Development'
              // jf 'rt bce module1 11'
              // jf 'rt bce Devops ${env.BUILD_NUMBER}'
          }
        }
    }
}

