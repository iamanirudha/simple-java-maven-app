pipeline {
    agent any
	
	tools {
	   jfrog 'jfrog-cli'
	}
	
	environment {
	   MVN_DEPLOY_RELEASE_REPO  = "Aplha "
	   MVN_DEPLOY_SNAPSHOT_REPO = "Apha-snapshot"
	}
	
	stages{
	  stage('Maven Build'){
            when {
	      not {
	        anyOf {
			branch 'master'; branch 'staging'
		}
	      }
	    }
            steps {
	      jf 'mvn-config  --repo-deploy-releases ${env.MVN_DEPLOY_RELEASE_REPO} --repo-deploy-snapshots ${env.MVN_DEPLOY_SNAPSHOT_REPO}'
              jf 'mvn clean install'
	  }
	}
	  
	  stage('Publish Artifacts') {
            when {
	      not {
	        anyOf {
			branch 'master'; branch 'staging'
		}
	      }
	    }
	    steps {
	      jf 'rt build-publish'
	    }
	  }
	
	}
}
