FROM maven:3.9.0-eclipse-temurin-17 as build
WORKDIR /app
COPY . .
RUN mvn clean install

FROM eclipse-temurin:17.6.10-jkd
WORKDIR /app
COPY --from=build /app/target/demo-0.0.1-SNAPSHOT.jar /app/
EXPOSE 8080
CMD ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]


# FROM adoptopenjdk/openjdk17:alpine-slim as build
# WORKDIR /workspace/app

# COPY mvnw .
# COPY .mvn .mvn
# COPY pom.xml .
# COPY src src

# RUN ./mvnw install -DskipTests
# RUN mkdir -p target/dependency && (cd target/dependency; jar -xf ../*.jar)

# FROM adoptopenjdk/openjdk17:alpine-slim
# VOLUME /tmp
# ARG DEPENDENCY=/workspace/app/target/dependency
# COPY --from=build ${DEPENDENCY}/BOOT-INF/lib /app/lib
# COPY --from=build ${DEPENDENCY}/META-INF /app/META-INF
# COPY --from=build ${DEPENDENCY}/BOOT-INF/classes /app
# ENTRYPOINT ["java","-Dserver.port=${PORT}","-cp","app:app/lib/*","com.example.demo.DemoApplication"]