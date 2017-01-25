FROM java:8

ARG BASE_DIR=/usr/src/
RUN mkdir -p $BASE_DIR
COPY wso2am-2.0.0.zip $BASE_DIR
COPY wso2am-analytics-2.0.0.zip $BASE_DIR
COPY run.sh $BASE_DIR
RUN chmod +x $BASE_DIR/run.sh

WORKDIR $BASE_DIR
RUN unzip wso2am-2.0.0.zip && \
    rm -f wso2am-2.0.0.zip && \
    unzip wso2am-analytics-2.0.0.zip && \
    rm -f wso2am-analytics-2.0.0.zip

WORKDIR $BASE_DIR
EXPOSE 10397 8280 8243 9763 9443 9444
CMD ./run.sh