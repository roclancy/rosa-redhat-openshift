
# will clone the terraform repo - that creates the vpc
git clone git@github.com:openshift-cs/terraform-vpc-example.git terraform-vpc-rosa

cp 7-create-terraform.tfvars-file.sh ./terraform-vpc-rosa
cp 8-terraform-vpc-apply.sh ./terraform-vpc-rosa


# now changes to the directory you cloned
cd ./terraform-vpc-rosa

