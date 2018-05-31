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

# Configure WSO2AM
COPY files $PRODUCT_HOME

WORKDIR $PRODUCT_HOME/bin
EXPOSE 10397 8280 8243 9763 9443
ENTRYPOINT [ "./wso2server.sh" ]