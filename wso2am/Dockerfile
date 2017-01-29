FROM java:8

ARG BASE_DIR=/usr/src/
ENV WSO2AM_HOME=$BASE_DIR/wso2am
RUN mkdir -p $BASE_DIR
COPY wso2am-2.0.0.zip $BASE_DIR

WORKDIR $BASE_DIR
RUN unzip wso2am-2.0.0.zip && \
    rm -f wso2am-2.0.0.zip && \
    mv wso2am-2.0.0 wso2am
COPY conf $WSO2AM_HOME

RUN sed -i -e 's/<BPSHost>/wso2bps/g' $WSO2AM_HOME/repository/deployment/server/jaggeryapps/admin/site/conf/site.json && \
    sed -i -e 's/<BPSPort>/9445/g' $WSO2AM_HOME/repository/deployment/server/jaggeryapps/admin/site/conf/site.json

WORKDIR $WSO2AM_HOME/bin
EXPOSE 10397 8280 8243 9763 9443
CMD ./wso2server.sh -Dsetup