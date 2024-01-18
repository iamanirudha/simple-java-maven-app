pipeline {
    agent any

    tools {
        maven 'maven3'
        jfrog 'jfrog-cli'
    }

    environment {
        PROJECT = "Delta"
        PROJECT_KEY = "delta"
        DEPLOYMENT_TYPE = "Development"
    }

    stages {
        stage ('Artifactory configuration') {
            steps {
                rtServer (
                    id: "jfrog-server",
                    url: "172.17.0.3:8082",
                    credentialsId: "jfrog"
                )

                rtMavenDeployer (
                    id: "MAVEN_DEPLOYER",
                    serverId: "jfrog-server",
                    releaseRepo: "delta-releases-repo",
                    snapshotRepo: "delta-snapshot-repo"
                )

                rtMavenResolver (
                    id: "MAVEN_RESOLVER",
                    serverId: "jfrog-server",
                    releaseRepo:  "delta-remote-repo" ,
                    snapshotRepo: "delta-remote-repo"
                )
            }
        }
        
        stage ('Exec Maven') {
            steps {
                rtMavenRun (
                    tool: "maven3", // Tool name from Jenkins configuration
                    pom: './pom.xml',
                    goals: 'clean install',
                    deployerId: "MAVEN_DEPLOYER",
                    resolverId: "MAVEN_RESOLVER"
                )
            }
        }
    }
}
