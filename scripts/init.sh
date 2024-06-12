#!/bin/bash
script_dir=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
echo "script directory is : $script_dir"

export GIT_BRANCH=develop

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
    /var/jenkins_home/bin/jf mvn-config --repo-deploy-releases ${RELEASES_REPO} --repo-deploy-snapshots ${RELEASES_REPO}
    # Add commands specific to the develop branch
    ;;
  feature*)
    echo "On a feature branch. Running feature branch commands."
    /var/jenkins_home/bin/jf mvn-config --repo-deploy-releases ${SNAPSHOT_REPO} --repo-deploy-snapshots ${SNAPSHOT_REPO}
    # Add commands specific to feature branches
    ;;
  *)
    echo "On an unspecified branch. Running default commands."
    # Add default commands for other branches
    ;;
esac



