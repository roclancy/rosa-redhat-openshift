
# creates the OpenShift ROSA Cluster

rosa create cluster --cluster-name ${CLUSTER_NAME} \
--sts --role-arn arn:aws:iam::${AWS_ACCOUNT_ID}:role/ManagedOpenShift-HCP-ROSA-Installer-Role \
--support-role-arn arn:aws:iam::${AWS_ACCOUNT_ID}:role/ManagedOpenShift-HCP-ROSA-Support-Role \
--worker-iam-role arn:aws:iam::${AWS_ACCOUNT_ID}:role/ManagedOpenShift-HCP-ROSA-Worker-Role \
--external-id ${EXTERNAL_ID} \
--operator-roles-prefix ${PREFIX} \
--oidc-config-id ${OIDC_CONFIG_ID} \
--tags "owner:${OWNER}" \
--region ${REGION} \
--version ${OCP_VERSION} \
--replicas 3 \
--compute-machine-type m5.xlarge \
--machine-cidr 10.0.0.0/16 \
--service-cidr 172.30.0.0/16 \
--pod-cidr 10.1.0.0/16 \
--host-prefix 23 \
--subnet-ids ${SUBNET_IDS} \
--disable-workload-monitoring \
--hosted-cp \
--billing-account ${AWS_ACCOUNT_ID} \
--no-cni \
--watch