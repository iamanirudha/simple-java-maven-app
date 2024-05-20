#!/bin/bash
export GIT_BRANCH=develop
export JF_CLI="/var/jenkins_home/tools/io.jenkins.plugins.jfrog.JfrogInstallation/jfrog-cli/jf"

# Ensure GIT_BRANCH variable is set.
# GIT_BRANCH variable is pre-defined only in Jenkins Multibranch pipeline.

if [ -z "$GIT_BRANCH" ]; then
  echo "GIT_BRANCH variable is undefined, make sure you are running a Multibranch pipeline."
  exit 1
fi

# Use a case statement to check the branch and run commands
case "$GIT_BRANCH" in
  develop)
    echo "On the develop branch. Running develop branch commands."
    export MAVEN_DEPLOY_REPO=poc-repo
    export MAVEN_RESOLVE_REPO=poc-resolve-repo
    $JF_CLI mvn-config --repo-deploy-releases $MAVEN_DEPLOY_REPO --repo-deploy-snapshots $MAVEN_RESOLVE_REPO
    # Add commands specific to the develop branch
    ;;
  feature*)
    echo "On a feature branch. Running feature branch commands."
    # Add commands specific to feature branches
    ;;
  *)
    echo "On an unspecified branch. Running default commands."
    # Add default commands for other branches
    ;;
esac


# Extract values from pom.xml using mvn help:evaluate
GROUP_ID=$(mvn help:evaluate -Dexpression=project.groupId -q -DforceStdout)
ARTIFACT_ID=$(mvn help:evaluate -Dexpression=project.artifactId -q -DforceStdout)
VERSION=$(mvn help:evaluate -Dexpression=project.version -q -DforceStdout)
ARTIFACT_NAME="${GROUP_ID}:${ARTIFACT_ID}:${VERSION}"

# Output the extracted values
echo "Group ID: $GROUP_ID"
echo "Artifact ID: $ARTIFACT_ID"
echo "Version: $VERSION"
echo "Artifact Name: $ARTIFACT_NAME"
