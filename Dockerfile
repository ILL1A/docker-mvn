FROM maven:3-eclipse-temurin-11 as maven
ENV HOME=/app
RUN mkdir -p $HOME
WORKDIR $HOME
COPY pom.xml $HOME/pom.xml
RUN mvn dependency:resolve
COPY src $HOME/src
RUN mvn clean package
ENTRYPOINT ["java", "-jar", "target/mvntest-1.0-SNAPSHOT-jar-with-dependencies.jar"]