FROM ubuntu:16.04

# Install Oracle Java
# 8u144 is recommended.
# See https://docs.wso2.com/display/AM220/Installation+Prerequisites
ADD bin/jdk-8u144-linux-x64.tar.gz /opt/
RUN mv /opt/jdk* /opt/java
ENV JAVA_HOME=/opt/java/ \
    PATH=/opt/java/bin:$PATH

# Install WSO2AM
ARG PRODUCT_HOME=/opt/wso2am
COPY bin/wso2am-*.zip /tmp
RUN cd /tmp && \
    jar Mxf wso2am-*.zip && \
    chmod -R a+x wso2am-*/bin/*.sh && \
    rm -f wso2am-*.zip && \
    mv wso2am-* $PRODUCT_HOME

# Install PostgreSQL JDBC Driver
#COPY postgresql-*.jar $PRODUCT_HOME/conf/repository/components/lib

#RUN sed -i -e '/<Analytics>/,/<\/Analytics>/ s/<Enabled>false<\/Enabled>/<Enabled>true<\/Enabled>/' \
#           -e '/DASServerURL/ s/localhost/wso2am-analytics/' \
#           -e '/DASAuthServerURL/ s/localhost/wso2am-analytics/' \
#           -e '/DASRestApiURL/ s/localhost/wso2am-analytics/' \
#           -e 's/<!--DASAuthServerURL>\(.*\)<\/DASAuthServerURL-->/<DASAuthServerURL>\1<\/DASAuthServerURL>/' \
#           $WSO2AM_HOME/repository/conf/api-manager.xml && \
#    sed -i -e 's/\(^log4j.rootLogger=.*\)/\1, DAS_AGENT/' $WSO2AM_HOME/repository/conf/log4j.properties && \
#    sed -i -e 's/<BPSHost>/wso2bps/g' $WSO2AM_HOME/repository/deployment/server/jaggeryapps/admin/site/conf/site.json && \
#    sed -i -e 's/<BPSPort>/9445/g' $WSO2AM_HOME/repository/deployment/server/jaggeryapps/admin/site/conf/site.json

COPY files $PRODUCT_HOME

WORKDIR $PRODUCT_HOME/bin
EXPOSE 10397 8280 8243 9763 9443
ENTRYPOINT [ "./wso2server.sh" ]