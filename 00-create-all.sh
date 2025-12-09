

echo " "
echo " ********************************************* "
echo " ********************************************* "
echo " "
echo "          CREATING ENV VARIBALES "
echo " "
echo " ********************************************* "
echo " ********************************************* "
echo " "
source 0-env.sh

echo " "
echo " ********************************************* "
echo " ********************************************* "
echo " "
echo " LOGGING INTO THE REDHAT PORTAL TO GET TOKEN "
echo " YOU WILL NEED TO LOG INTO THE RH PORTAL NOW "
echo " "
echo " ********************************************* "
echo " ********************************************* "
echo " "

source 1-login-to-redhat.sh

echo " "
echo " ********************************************* "
echo " ********************************************* "
echo " "
echo " VALIDATING YOUR REDHAT CONNECTION IS WORKING  "
echo " "
echo " ********************************************* "
echo " ********************************************* "
echo " "

source 2-verification-check.sh

echo " "
echo " ********************************************* "
echo " ********************************************* "
echo " "
echo " CREATING A OIDC CONNECTION FOR ROSA   "
echo " AND AN ENV CALLED  OIDC_CONFIG_ID  "
echo " WHICH IS USED LATER IN THE CONFIG SETUP "
echo " "
echo " ********************************************* "
echo " ********************************************* "
echo " "

source 3-create-oidc-connection.sh

echo " "
echo " ********************************************* "
echo " ********************************************* "
echo " "
echo " CREATING ROSA ACCOUNT & OPERATOR ROLES IN AWS "
echo " AND CREATING AN ENV - PREFIX & "
echo " "
echo " ********************************************* "
echo " ********************************************* "
echo " "

source 4-create-account-roles.sh
source 5-create-operator-roles-and-policies.sh

echo " "
echo " ********************************************* "
echo " ********************************************* "
echo " "
echo " CREATING ROSA VPC IN AWS "
echo " TERRFORM IS USED TO CREATE THE VPC"
echo " IT WILL ALSO PULL THE SUBNETS FROM THIS VPC"
echo " AND GET THE VPC FROM AWS, FIND & CREATE ENV "
echo " FOR THE SUBNETS CLLED SUBNET_IDS "
echo " "
echo " ********************************************* "
echo " ********************************************* "
echo " "


source 6-vpc-terraform-clone-repo.sh

source 7-create-terraform.tfvars-file.sh

source 8-terraform-vpc-apply.sh


echo " "
echo " ********************************************* "
echo " ********************************************* "
echo " ********************************************* "
echo " ********************************************* "
echo " ********************************************* "
echo " ********************************************* "
echo " "
echo " -- CREATING A ROSA OPENSHIFT CLUSTER ON AWS --"
echo " -- CLUSTER NAME = $CLUSTER_NAME --------------"
echo " -- THIS TAKES ABOUT 10 MINS ---------------"
echo " "
echo " ********************************************* "
echo " ********************************************* "
echo " ********************************************* "
echo " ********************************************* "
echo " ********************************************* "
echo " ********************************************* "
echo " "
source 9-create-cluster.sh

echo " "
echo " ********************************************* "
echo " ********************************************* "
echo " "
echo " CHECKING THE OPENSHIFT CLUSTER   "
echo " "
echo " ********************************************* "
echo " ********************************************* "
echo " "
source 10-check-cluster.sh

echo " "
echo " ********************************************* "
echo " ********************************************* "
echo " "
echo "  CREATING AN OC ADMIN ACCOUNT & PASSWORD   "
echo "  FOR THE NEW CLUSTER & LOGGING AS ADMIN  "
echo " "
echo "  A NEW FILE IS CREATED TO STORE THE LOG IN DETAILS  "
echo "  CALLED ---- oc-login.sh  "
echo " "
echo " ********************************************* "
echo " ********************************************* "
echo " "
source 11-create-admin-password.sh

echo " "
echo " "
echo " ********************************************* "
echo " ********************************************* "
echo " "
echo "  CHECKING OPENSHIFT NODES STATUS   "
echo " " 
echo " ********************************************* "
echo " ********************************************* "
echo " "

source 12-check-nodes-status.sh


