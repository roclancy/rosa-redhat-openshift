
#will create an oidc connection in AWS

rosa create oidc-config --mode=auto  --yes


#will list all rosa oidc connections - you may have an issue if the oidc connector is miss matched 
# use this command to check you are using the right one

rosa list oidc-config


#create env for the oidc

export OIDC_CONFIG_ID=$(rosa list oidc-config --output json | jq -r '.[0].id')

