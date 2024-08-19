FROM maven:3.9.0-eclipse-temurin-17 as build
WORKDIR /app
COPY . .
RUN mvn clean install

FROM eclipse-temurin:17.6.10-jkd
WORKDIR /app
COPY --from=build /app/target/demoapp.jar /apps/
EXPOSE 8080
CMD ["java", "-jar", "demoapp.jar"]