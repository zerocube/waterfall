FROM ubuntu:20.04

ARG SOURCE_JAR=https://papermc.io/api/v2/projects/waterfall/versions/1.17/builds/448/downloads/waterfall-1.17-448.jar

RUN apt update
RUN apt install -y openjdk-16-jre curl

WORKDIR /app
RUN curl \
  -L \
  -o waterfall.jar \
  "${SOURCE_JAR}"

ENV JAVA_XMX 1G

COPY ./app/ /app/

ENTRYPOINT ["java", "-Xmx${JAVA_XMX}", "-jar", "/app/waterfall.jar"]
