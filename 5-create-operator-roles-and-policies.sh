
#Will create roles and policies

rosa create operator-roles --hosted-cp --prefix ${PREFIX} --oidc-config-id ${OIDC_CONFIG_ID}

# out put a list of operator roles
rosa list operator-roles

#rosa create operator-roles \
#  --hosted-cp \
#  --oidc-config-id "${OIDC_CONFIG_ID}" \
#  --mode auto

