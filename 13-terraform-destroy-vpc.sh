# destroy all vpc resources created 

cp 13-terraform-destroy-vpc.sh ./terraform-vpc-rosa 

cd terraform-vpc-rosa/

terraform destroy -var "region=$REGION" -auto-approve


cd ../

