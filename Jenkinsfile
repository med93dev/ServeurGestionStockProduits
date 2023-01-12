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
      sh 'docker build -t shadow112233/serveur-produits .'
        }
  
        stage('Push image to Hub'){
            steps{
                script{
                   withCredentials([string(credentialsId: 'docker_hub', variable: 'dockerhubpwd')]) {
                   sh 'docker login -u shadow112233 -p ${dockerhubpwd}'

}
                   sh 'docker push shadow112233/serveur-produits'
                }
            }
        }
        }
    
