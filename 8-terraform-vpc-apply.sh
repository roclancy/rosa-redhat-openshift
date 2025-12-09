
# run terraform to create the vpc

terraform init

terraform plan -var "region=$REGION" -out rosa.tfplan

#terraform plan -out rosa.tfplan

terraform apply -auto-approve rosa.tfplan

echo " *********************************************************"
echo " *********************************************************"
echo " "
echo "------ SLEEPING FOR 120 SECONDS ------------ "
echo "-- AFTER THIS IT WILL GET THE AWS VPC_ID & SUBNETS_ID  "
echo "-- NOW CREATING ENV FOR THE SUBNETS_ID NEEDED FOR LATER CONFIG "
echo " "
echo " **********************************************************"
echo " ***********************************************************"

sleep 120
#Now create an env to hold the subnet-ids for the rosa vpc you just created 
#first get the rosa vpc id

export VPC_ID=$(aws ec2 describe-vpcs \
  --filters "Name=tag:Name,Values=rosa*" \
  --query "Vpcs[0].VpcId" \
  --output text)


# now get the subnets associated with the rosa VPC

export SUBNET_IDS=$(aws ec2 describe-subnets \
  --filters "Name=vpc-id,Values=$VPC_ID" \
  --query "Subnets[].SubnetId" \
  --output json | jq -r 'join(",")')

# change back to directory with scripts

echo " ***************************"
echo " ***************************"
echo " "
echo " BELOW ARE THE VPC AND SUBNETS DISCOVERED FROM AWS"
echo " AND USED TO CREATE ENV VARIABLES"
echo " "
echo " ***************************"
echo " ***************************"

echo $VPC_ID
echo $SUBNET_IDS

cd ../