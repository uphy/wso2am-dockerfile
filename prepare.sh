#!/bin/sh

# Extract epr files from wso2am archive
mkdir -p wso2bps/am/epr
for file in `unzip -l wso2am/wso2am-2.0.0.zip | cut -c 31- | egrep 'wso2am-2.0.0/business-processes/epr/.+'`; do
    unzip -p wso2am/wso2am-2.0.0.zip $file > wso2bps/am/epr/${file##*/}
done

# Extract bpel files from wso2am archive
mkdir -p wso2bps/am/bpel
for file in `unzip -l wso2am/wso2am-2.0.0.zip | cut -c 31- | egrep 'wso2am-2.0.0/business-processes/.+?\.zip'`; do
    unzip -p wso2am/wso2am-2.0.0.zip $file > wso2bps/am/bpel/${file##*/}
done
