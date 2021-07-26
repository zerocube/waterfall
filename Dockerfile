FROM ubuntu:20.04

RUN apt update
RUN apt install -y openjdk-16-jre

ENTRYPOINT ["java"]
