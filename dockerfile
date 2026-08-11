# -----stage: Build-------

FROM maven:3.9.9-eclipse-temurin-17 AS builder 

WORKDIR /app

COPY pom.xml . 

RUN mvn install dependency:go-offline -B 

COPY src ./src 

RUN mvn clean package -DskipTests -B

# ------stage: Run--------

FROM eclipse-temurin:17-jre-jammy 

WORKDIR /app 

COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080 

CMD ["java" ," -jar" , "app.jar"]

