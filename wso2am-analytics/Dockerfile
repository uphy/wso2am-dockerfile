FROM java:8

ARG BASE_DIR=/usr/src/
RUN mkdir -p $BASE_DIR
COPY wso2am-analytics-2.0.0.zip $BASE_DIR

WORKDIR $BASE_DIR
RUN unzip wso2am-analytics-2.0.0.zip && \
    rm -f wso2am-analytics-2.0.0.zip
COPY conf $BASE_DIR/wso2am-analytics-2.0.0

WORKDIR $BASE_DIR/wso2am-analytics-2.0.0/bin
EXPOSE 7612 7712 9444
CMD ./wso2server.sh -Dsetup