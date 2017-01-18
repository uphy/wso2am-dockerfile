# Dockerfile for WSO2 API Manager

## Preparation

Download wso2am-2.0.0.zip from http://wso2.com/products/api-manager/

## Build

docker build -t wso2am .

## RUN

docker run --name mywso2am -p 9443:9443 -it wso2am
