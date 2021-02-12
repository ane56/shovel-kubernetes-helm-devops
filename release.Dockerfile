FROM openjdk:8-jdk-alpine
ENV WORKSPACE=/opt/shovel-kh
WORKDIR $WORKSPACE

ADD target/shovel-kubernetes-helm-1.0.0.jar .
ADD script/bin/deploy.sh .
RUN chmod -R +x ./deploy.sh
ENV JAVA_XMS=1g
ENV JAVA_XMX=1g
ENTRYPOINT ["./deploy.sh"]
CMD ["start"]