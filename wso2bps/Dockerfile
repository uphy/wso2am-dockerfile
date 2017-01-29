FROM java:8

ARG BASE_DIR=/usr/src/
ENV WSO2BPS_HOME=$BASE_DIR/wso2bps/
COPY wso2bps-3.6.0.zip $BASE_DIR

WORKDIR $BASE_DIR
RUN unzip wso2bps-3.6.0.zip && \
    rm -f wso2bps-3.6.0.zip && \
    mv wso2bps-3.6.0 wso2bps

COPY scripts $WSO2BPS_HOME/scripts
RUN chmod +x $WSO2BPS_HOME/scripts/*

# Refer: https://docs.wso2.com/display/AM200/Adding+an+Application+Creation+Workflow
WORKDIR $WSO2BPS_HOME
RUN sed -i -e 's/<Offset>0</<Offset>2</g' repository/conf/carbon.xml
RUN sed -i -e 's/<TaskCoordinationEnabled>false</<TaskCoordinationEnabled>true</g' repository/conf/humantask.xml
COPY am/epr $WSO2BPS_HOME/repository/conf/epr
COPY am/bpel $WSO2BPS_HOME/bpel

WORKDIR $WSO2BPS_HOME
CMD scripts/run.sh