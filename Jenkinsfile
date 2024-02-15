pipeline {
    agent any 

    tools{
         maven 'maven3'
         jfrog 'jfrog-cli'
         // java  'jdk8'
    }
    /*
    DO NOT CHANGE UNLESS YOU KNOW WHAT YOU ARE DOING.
    */
    environment{
        PROJECT = ""
        PROJECT_KEY = ""
        RELEASES_REPO = ""
        SNAPSHOT_REPO = ""
    }
    stages{
        /*
        This is a Initialization stage, we use this for setting up the Environment variables
        that will be used in the pipeline for conditional checks.
        */
        stage('Init'){
            steps{
                script{
                    def pom = readMavenPom file: './pom.xml'

                    // Define the groupId and artifactId of the dependency you want to check
                    def groupId = 'org.junit.jupiter'
                    def artifactId = 'junit-jupiter-api'

                    // Find the dependency in the POM
                    def dependency = pom.getDependencies().find {
                        it.getGroupId() == groupId && it.getArtifactId() == artifactId
                    }

                    // Extract the version of the dependency
                    def dependencyVersion = dependency.getVersion()

                    // Print the version
                    echo "Version of ${groupId}:${artifactId} is ${dependencyVersion}"
                }
            }
        }

       
        // stage('Deploy to PROD'){
        //     when{
        //         expression {
        //             env.GIT_BRANCH ==~ /(origin\/prod)/
        //         }
        //     }
        //     steps{
        //         sh "echo Deploy to PROD"
        //     }
        // }
    }
}
