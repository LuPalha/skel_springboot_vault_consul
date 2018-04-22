FROM cvcbrasil/java:8u141-jre

RUN apk add --no-cache ca-certificates curl gnupg libcap openssl && \
    wget https://releases.hashicorp.com/envconsul/0.7.3/envconsul_0.7.3_linux_amd64.tgz && \
    tar zxvf envconsul_0.7.3_linux_amd64.tgz -C /usr/local/bin

RUN mkdir /opt/cvc_app

WORKDIR /opt/cvc_app

COPY ./target/RiskAnalysis*.jar cvc_app.jar

SHELL ["/bin/bash","-c"]

EXPOSE 8080
EXPOSE 5005

CMD envconsul -consul $CONSUL_URL -prefix $PREFIX java ${ADDITIONAL_OPTS} -jar cvc_app.jar
