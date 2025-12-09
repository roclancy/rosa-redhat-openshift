
# creates an admin account and prints out the password

#rosa create admin --cluster=${CLUSTER_NAME}

#rosa create admin --cluster="${CLUSTER_NAME}" 2>&1 | grep "oc login" > login.txt

#rosa create admin --cluster="${CLUSTER_NAME}" 2>&1 | grep "oc login" | sed 's/^[[:space:]]*//' > oc-login.sh

rosa create admin --cluster="${CLUSTER_NAME}" 2>&1 \
  | grep "oc login" \
  | sed 's/^[[:space:]]*//' \
  | tr -d '\n' > oc-login.sh

sleep 30

source oc-login.sh

