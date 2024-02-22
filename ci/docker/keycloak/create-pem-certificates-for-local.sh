#!/bin/bash

keytool -genkeypair -alias keycloak -keyalg RSA -keysize 2048 -validity 3650 -keystore keycloak.jks -storepass power_eda_stack -dname "CN=localhost"
keytool -keystore keycloak.jks -certreq -alias keycloak -file keycloak-certreq.csr -storepass power_eda_stack
keytool -keystore keycloak.jks -keypass power_eda_stack -storepass power_eda_stack -gencert -infile keycloak-certreq.csr -outfile keycloak-certfile.crt -alias keycloak
openssl x509 -in keycloak-certfile.crt -inform DER -out keycloak-certfile.pem -outform PEM
openssl pkcs12 -in keycloak.jks -nodes -nocerts -out keycloak-keyfile.key -password pass:power_eda_stack -passin pass:power_eda_stack
openssl rsa -in keycloak-keyfile.key -out keycloak-keyfile.pem

mv keycloak-certfile.pem ./pem/keycloak-certfile.pem
mv keycloak-keyfile.pem ./pem/keycloak-keyfile.pem
rm -f keycloak.jks
rm -f keycloak-certreq.csr
rm -rf keycloak-certfile.crt
rm -rf keycloak-keyfile.key



