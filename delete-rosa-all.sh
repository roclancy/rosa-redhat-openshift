
echo " "
echo " "
echo " ********************************************* "
echo " ********************************************* "
echo " "
echo "  DELETE ALL ROSA CONFIG - CLUSTER & AWS CONFIG   "
echo "     & REMOVING TERRAFORM CONFIG"
echo " " 
echo " ********************************************* "
echo " ********************************************* "
echo " "

source 14-delete-rosa-cluster.sh

source 13-terraform-destroy-vpc.sh

echo " "
echo " "
echo " ***************************************************** "
echo " ***************************************************** "
echo " "
echo "  SLEEPING FOR ***** - 10 MIN'S - ********   "
echo "  --- WAITING FOR OPENSHIFT CLUSTER TO BE DESTROYED "
echo "  ------ AFTER THIS THE OIDC & ROLES WILL BE DESTROYED    "
echo " " 
echo " ****************************************************** "
echo " ****************************************************** "
echo " "

sleep 600

source 15-delete-oidc-connection-rosa.sh

source 16-delete-rosa-operator-roles.sh

rm oc-login.sh

rm -rf terraform-vpc-rosa/