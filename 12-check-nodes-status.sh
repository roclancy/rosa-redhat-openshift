
#after logged into your Open Shift cluster check the status of your nodes

oc projects


echo " "
echo " ********************************************* "
echo " ********************************************* "
echo " "
echo " ------SLEEPING FOR 10 MINS ------  "
echo " WAITING FOR NODES TO BECOME FULLY ACTIVE"
echo " "
echo " ********************************************* "
echo " ********************************************* "
echo " "
sleep 600
oc get nodes -o wide -A

