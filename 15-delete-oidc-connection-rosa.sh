
#this will delete the oidc connector held by rosa cli and on AWS

rosa delete oidc-config --oidc-config-id ${OIDC_CONFIG_ID} --mode auto -y

#need to find away to auto approve 
