node {
  stage("Clone the project") {
    git branch: 'master', url: 'https://github.com/med93dev/ServeurGestionStockProduits.git'
  }

  stage("Compilation") {
    sh "chmod +x -R ${env.WORKSPACE}"
    sh "./mvnw clean install -DskipTests"
  }

    stage("Runing unit tests") {
      sh "chmod +x -R ${env.WORKSPACE}"
      sh "./mvnw test -Punit"
    }
  
    
  stage('Build docker image'){
        def dockerHome = tool 'myDocker'
        env.PATH = "${dockerHome}/bin:${env.PATH}"
      sh 'docker build -t Shadow112233/ServeurGestionStockProduits .'
        }
  
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'docker_hub', variable: 'dockerhubpwd')]) {
                   sh 'docker login -u Shadow112233 -p ${dockerhubpwd}'

}
                   sh 'docker push Shadow112233/ServeurGestionStockProduits'
                }
            }
        }
        }
    
