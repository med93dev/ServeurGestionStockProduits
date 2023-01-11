FROM openjdk:11
EXPOSE 8080
ADD target/ServeurGestionStockProduits-0.0.1-SNAPSHOT.jar  ServeurGestionStockProduits-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/ServeurGestionStockProduits-0.0.1-SNAPSHOT.jar]
