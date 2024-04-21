FROM eclipse-temurin:17-jdk-alpine
COPY target/*.jar trainTruck.jar
EXPOSE 8080
EXPOSE 5332
EXPOSE 5432
ENTRYPOINT ["java","-jar","trainTruck.jar"]