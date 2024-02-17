FROM ubuntu:24.04

ARG SOURCE_JAR=https://api.papermc.io/v2/projects/waterfall/versions/1.20/builds/562/downloads/waterfall-1.20-562.jar

RUN apt update
RUN apt install -y curl openjdk-21-jre

WORKDIR /app
RUN curl \
  -L \
  -o waterfall.jar \
  "${SOURCE_JAR}"

ENV JAVA_XMX 1G

COPY ./app/ /app/

ENTRYPOINT ["/app/entrypoint.sh"]
