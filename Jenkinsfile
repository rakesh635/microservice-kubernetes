node {
  stage('SCM checkout') {
    git 'https://github.com/Thegaijin/microservice-kubernetes.git'
  }

  stage('test') {
    def mvnHome = tool name:'M3', type: 'maven'
    def mvnCMD = "${mvnHome}/bin/mvn"
    sh "${mvnCMD} clean test"
  }

  stage('compile and package') {
    def mvnHome = tool name:'M3', type: 'maven'
    def mvnCMD = "${mvnHome}/bin/mvn"
    sh "${mvnCMD} clean package"
  }

  stage('Build docker images') {
    sh 'docker-compose build'
  }

  stage('login to dockerhub') {
    withCredentials([string(credentialsId: 'docker-pwd', variable: 'dockerhubpwd')]) {
      sh 'docker login -u thegaijin -p ${dockerhubpwd}'
    }
  }

  stage('Push images to dockerhub') {
    sh 'docker-compose push'
  }

  stage('deploy') {
    sh 'kubectl apply -R -f ./k8s'
    sh 'kubectl expose deployment/apache --type="LoadBalancer" --port 80'
    sh 'kubectl expose deployment/catalog --type="LoadBalancer" --port 8080'
    sh 'kubectl expose deployment/customer --type="LoadBalancer" --port 8080'
    sh 'kubectl expose deployment/order --type="LoadBalancer" --port 8080'
    sh 'kubectl expose deployment/hystrix-dashboard --type="LoadBalancer" --port 8080'
    // sh 'pwd'
    // sh 'ls -la'
    // sh 'whoami'
    // sh '. /var/lib/jenkins/workspace/roservice-kubernetes_master-3J6HWCBX7U4CW4RDAEKB4QVSFBYSD5QEXCND4BTNSG6FXZIADRNA/deploy.sh'
  }
}
