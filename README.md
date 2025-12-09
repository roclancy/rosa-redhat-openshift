RedHat Openshift on AWS
===================
<img width="1495" height="825" alt="image" src="https://github.com/user-attachments/assets/bd77e032-715c-46fe-9743-a6a0010793c5" />
<br>

What this script will do <br /> 
================================
Contained within this repo is an automated one command script to create (and delete) a Red Hat Open Shift cluster on AWS known as ROSA as detailed in the install document below:<br /> 
https://docs.isovalent.com/ink/install/rosa.html#<br>
The Open Shift (ROSA) Cluster will not have a cni installed and is ready for the installation of Cilium and Isovalent solutions.
<br /> 
This repo will do the following <br /> 
<br /> 
1 - Log you into the Red Hat portal to obtain a token <br /> 
2 - Create on AWS an OIDC provider, and create ManagedOpenShift Accounts and Operator roles<br /> 
3 - Clone a Terrform repo needed to create a VPC, update the terraform files and then create the VPC on AWS<br /> 
4 - Intoragate AWS for the SUBNET_IDS needed and create some env variables<br /> 
5 - Create the ROSA Open Shift Cluster<br /> 
6 - Run checks against the Open Shift Cluster<br /> 
7 - Create an Admin user for the Open Shift Cluster and then auto log you in<br /> 
8 - Check you are sucessfully logged in as the Admin user<br />
9 - Check the status of your worker nodes<br /> 
<br /> 
<br />
<br />
<br>

Steps to install<br /> 
======================
<br /> 
1 - Make sure you have all CLI's listed here installed, kubectl, aws, eksctl and helm CLI tools should be installed <br />
https://docs.isovalent.com/v1.17/operations-guide/installation/eks-install.html#requirements <br />
<br />
2 - Clone this repo <br />
<br />
3 - You now change 1 file <br />
<br /> 
    - Put the name you want to call your EKS cluster & set your AWS Region, to the 0-env.sh file as shown in the image below <br /> 
    <br /> 
     <img width="443" height="121" alt="image" src="https://github.com/user-attachments/assets/bbdebda9-67b0-4103-b6a8-a699e14018b0" />
  <br />
  <br>
  
4 - Once you have completed the changes above, now run the following command from your terminal:<br />
<br />
source 0-create-all.sh<br /> 
<br />
5 - The script will now create all and install Isovalent Cilium and Hubble Timescape UI(lite), Once installed you can access the Hubble-Timescape UI with URL http://127.0.0.1:12000/<br /> 
<br />

NOTE:<br /> 
========================
<br /> 
During the install you will see an error message after installing the Helm charts, this is due to the helm chart waiting for the certificates (for TLS) pod<br />
to be created but this will not move to a running pod until the EKS nodes are created which is the next step after the error message.<br />
<br />
Below is a comment to identify the error message you will see : <br />
<br />
"****************************************"<br />
"THE ABOVE ERROR MESSAGE IS BECAUSE THE NODES HAVE NOT BEEN CREATED, AND THE POD FOR THE CERT IS WAITING TO BE ASSIGNED"<br />
"****************************************"<br />
