FROM maven:3-eclipse-temurin-8 AS builder

WORKDIR /app
COPY ./ .
RUN mvn package

FROM eclipse-temurin:8

WORKDIR /app
COPY --from=builder /app/target/fall-2023-fish-1.0-SNAPSHOT.jar /app/referee.jar
COPY ./src/main/resources /app/src/main/resources

ENTRYPOINT ["java", "-jar", "referee.jar"]
