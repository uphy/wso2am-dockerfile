#!/bin/bash

set -m
$WSO2BPS_HOME/bin/wso2server.sh &
sleep 120
find $WSO2BPS_HOME/bpel/ -name *.zip -exec $WSO2BPS_HOME/scripts/upload-bpel.sh {} \;
fg 1