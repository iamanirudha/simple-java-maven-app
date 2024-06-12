pipeline {
    agent any

    tools {
        maven 'maven3'
        jfrog 'jf'
    }

    environment {
        PROJECT = "poc-delta"
        RELEASES_REPO = "poc-repo"
        SNAPSHOT_REPO = "poc-snap"
        ARTIFACT_ID = readMavenPom().getArtifactId()
        VERSION = readMavenPom().getVersion()
    }

    stages {
        stage('Init') {
            steps {
                script {
                    // Configure Maven settings 
                    echo "${ARTIFACT_ID} ${VERSION}"
                    sh "chmod 755 scripts/init.sh"
                    sh "./scripts/init.sh"
                }
            }
        }

        stage('Build') {
            steps {
                script {
                    // Deployment steps go here
                    jf "mvn clean install --build-name ${env.PROJECT} --build-number ${env.BUILD_NUMBER}"
                }
            }
        }

       stage('Publish Build Info') {
           steps {
               script {
                    // Collect build environment 
                    jf "rt bce ${env.PROJECT} ${env.BUILD_NUMBER} "

                    // Publish the build information --project ${env.PROJECT_KEY}
                    jf "rt build-publish ${env.PROJECT} ${env.BUILD_NUMBER}"
               }
           }
       }

      stage('Create Release Bundle') {
          steps {
                // Write the file spec to the workspace with dynamic build name and number
                writeFile file: 'upload-spec.json', text: """
                {
                  "files": [
                    {
                      "build": "${env.PROJECT}/${env.BUILD_NUMBER}"
                    }
                  ]
                }
                """

              //Create Release Bundle
              // jf " rbc --spec=upload-spec.json --signing-key=myorgpair myFirstRB 1.0.0"
              jf "rbp --signing-key=myorgpair --input-repos='dev-rb-poc-delta' myFirstRB 1.0.0 DEV"
          }
      }
    }
}
