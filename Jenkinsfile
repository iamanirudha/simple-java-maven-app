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
                    url: "172.17.0.3",
                    credentialsId: "jfrog"
                )

                rtMavenDeployer (
                    id: "MAVEN_DEPLOYER",
                    serverId: "jfrog-server",
                    releaseRepo: "delta-releases-repo",
                    snapshotRepo: "delta-snapshot-repo"
                )

                // rtMavenResolver (
                //     id: "MAVEN_RESOLVER",
                //     serverId: "ARTIFACTORY_SERVER",
                //     releaseRepo: ARTIFACTORY_VIRTUAL_RELEASE_REPO,
                //     snapshotRepo: ARTIFACTORY_VIRTUAL_SNAPSHOT_REPO
                // )
            }
        }
        
        stage ('Exec Maven') {
            steps {
                rtMavenRun (
                    tool: maven, // Tool name from Jenkins configuration
                    pom: './pom.xml',
                    goals: 'clean install',
                    deployerId: "MAVEN_DEPLOYER",
                )
            }
        }
    }
}
