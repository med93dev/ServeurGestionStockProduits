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
    }
