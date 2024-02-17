FROM eclipse-temurin:21-jre-jammy

ARG SOURCE_JAR=https://api.papermc.io/v2/projects/waterfall/versions/1.20/builds/562/downloads/waterfall-1.20-562.jar

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
