FROM java:8-alpine

RUN mkdir -p "/usr/src"
COPY wso2am-2.0.0.zip /usr/src
WORKDIR /usr/src
RUN unzip wso2am-2.0.0.zip && \
    rm -f wso2am-2.0.0.zip

WORKDIR /usr/src/wso2am-2.0.0
CMD bin/wso2server.sh