FROM maven:3-jdk-8 AS builder

WORKDIR /workspace
ADD script/bin/ /opt/shovel-kh/bin/
ADD . .
RUN chmod -R +x /opt/shovel-kh/bin/
RUN echo "start build ..."

ENTRYPOINT mvn clean package -Dmaven.test.skip=true