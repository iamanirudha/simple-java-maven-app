#!/bin/bash

# Get the branch name from the GIT_BRANCH variable
branchWithPrefix=${GIT_BRANCH:-'master'}

# Extract the branch name without the "origin/" prefix
branchName=$(echo $branchWithPrefix | sed 's/^origin\///')

# Check the branch name and set DEPLOY_TO variable
if [[ "$branchName" == "main" ]]; then
    DEPLOY_TO='PRD'
elif [[ "$branchName" == "develop" || "$branchName" == feature* ]]; then
    DEPLOY_TO='DEV'
else
    DEPLOY_TO='UAT'
fi

# Print the branch name and DEPLOY_TO value
echo "Branch Name without prefix: $branchName"
echo "Deploy To: $DEPLOY_TO"

# Export DEPLOY_TO variable for Jenkins to use
export DEPLOY_TO
