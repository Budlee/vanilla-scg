FROM gradle:jdk11 as builder

COPY --chown=gradle:gradle . /home/gradle/src
WORKDIR /home/gradle/src
RUN gradle build

FROM adoptopenjdk:11-jre-hotspot
RUN mkdir /opt/app
COPY --from=builder /home/gradle/src/build/libs/vanilla_scg-*.jar /opt/app/app.jar
EXPOSE 8080
WORKDIR /etc/gateway/config/
ENTRYPOINT [ "java", "-jar", "/opt/app/app.jar" , "--spring.config.location=file:/etc/gateway/config/application.yaml"]