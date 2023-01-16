FROM openjdk:18-slim

ARG SOURCE_JAR=https://api.papermc.io/v2/projects/paper/versions/1.19.3/builds/378/downloads/paper-1.19.3-378.jar

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
