
# this will delete all the rosa roles created

rosa delete account-roles --mode auto -y --prefix ${PREFIX}

rosa delete operator-roles --mode auto -y --prefix ${PREFIX}


