#!/bin/bash

REQUEST_FILE=request.xml
BPEL_FILE=$1
BPEL_FILENAME=${BPEL_FILE##*/}
BPEL_UPLOADER=https://localhost:9445/services/BPELUploader

# Generate SOAP request file.
cat << EOS > $REQUEST_FILE
<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:ser="http://services.deployer.bpel.carbon.wso2.org" xmlns:xsd="http://types.services.deployer.bpel.carbon.wso2.org/xsd">
   <soapenv:Header/>
   <soapenv:Body>
      <ser:uploadService>
         <ser:fileItems>
            <!--Optional:-->
            <xsd:dataHandler>
EOS

base64 $BPEL_FILE >> $REQUEST_FILE

cat << EOS >> $REQUEST_FILE
            </xsd:dataHandler>
            <!--Optional:-->
            <xsd:fileName>$BPEL_FILENAME</xsd:fileName>
            <!--Optional:-->
            <xsd:fileType>zip</xsd:fileType>
         </ser:fileItems>
      </ser:uploadService>
   </soapenv:Body>
</soapenv:Envelope>
EOS

# Invoke SOAP request.
curl --user admin:admin -k -s -v \
     --header "Content-Type: text/xml;charset=UTF-8" \
     --header "SOAPAction: urn:uploadService" \
     --data @$REQUEST_FILE $BPEL_UPLOADER 

# Delete temporary request file.
rm -f $REQUEST_FILE
