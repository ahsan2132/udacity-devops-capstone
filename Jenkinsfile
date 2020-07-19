node {
    def registry1 = 'ahsan2132/testblueimage'
    def registry2 = 'ahsan2132/testgreenimage'
    stage('Checking out git repo') {
      echo 'Checkout...'
      checkout scm
    }
    stage('Checking environment') {
      echo 'Checking environment...'
      sh 'git --version'
      echo "Branch: ${env.BRANCH_NAME}"
      sh 'docker -v'
    }
    stage("Linting") {
      echo 'Linting...'
      sh '/usr/bin/hlint blue/Dockerfile'
      sh '/usr/bin/hlint green/Dockerfile'
    }
    stage('Blue Build') {
	    echo 'Building blue image'
      withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
	     	sh "sudo docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
	     	sh "sudo docker build -t ${registry1} blue/."
	     	sh "sudo docker tag ${registry1} ${registry1}"
	     	sh "sudo docker push ${registry1}"
      }
    }
    stage('Green Build') {
	    echo 'Building green image'
      withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'dockerHubPassword', usernameVariable: 'dockerHubUser')]) {
	     	sh "sudo docker login -u ${env.dockerHubUser} -p ${env.dockerHubPassword}"
	     	sh "sudo docker build -t ${registry2} green/."
	     	sh "sudo docker tag ${registry2} ${registry2}"
	     	sh "sudo docker push ${registry2}"
      }
    }
    stage('EKS Deployment') {
      echo 'AWS EKS Deployment started'
      dir ('./') {
        withAWS(credentials: 'ecr-credentials', region: 'us-west-2') {
            sh "aws eks --region us-west-2 update-kubeconfig --name test-cluster"
            sh "kubectl apply -f blue/blue-controller2.json"
            sh "kubectl apply -f green/green-controller3.json"
            sh "kubectl apply -f ./blue-green-service.json"
            sh "kubectl get nodes"
            sh "kubectl get pods"
        }
      }
    }
}
