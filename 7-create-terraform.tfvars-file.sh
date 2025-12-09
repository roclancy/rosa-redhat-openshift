
# create the terrform.tfvars file

cat > ./terraform.tfvars << EOF
Region               = "${REGION}"
Subnet_azs           = ["apne2-az1", "apne2-az2", "apne2-az3", "apne2-az4"]
Cluster_name         = "${CLUSTER_NAME}"
#Select a private range, plan with plenty of room for growth
Vpc_cidr             = "10.0.0.0/16"
#This determines whether there is more room for new subnets or whether the subnets are bigger
Subnet_cidr_prefix   = 24
Private_subnets_only = false
#Having the cluster stretched over 3 az is a common practice for high availability. Single zone clusters incur less cost and latency.
Single_az_only       = false
EOF