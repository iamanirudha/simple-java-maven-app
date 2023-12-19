pipeline {
    agent any
	
	tools {
	   jfrog 'jfrog-cli'
	   maven 'maven3'
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
	      jf 'mvn-config  --repo-deploy-releases Aplha --repo-deploy-snapshots Apha-snapshot'
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
	      jf "rt u target/*.jar ${env.MVN_DEPLOY_RELEASE_REPO} --build-name MODULE2 --build-number ${env.BUILD_NUMBER}" 
	      jf 'rt build-publish'
	    }
	  }
	
	}
}
