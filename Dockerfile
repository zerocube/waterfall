FROM openjdk:18-slim

ARG SOURCE_JAR=https://papermc.io/api/v2/projects/waterfall/versions/1.18/builds/486/downloads/waterfall-1.18-486.jar

RUN apt update
RUN apt install -y curl

WORKDIR /app
RUN curl \
  -L \
  -o waterfall.jar \
  "${SOURCE_JAR}"

ENV JAVA_XMX 1G

COPY ./app/ /app/

ENTRYPOINT ["/app/entrypoint.sh"]
