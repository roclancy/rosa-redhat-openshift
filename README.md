RedHat Openshift on AWS
===================

<br>

What this script will do <br /> 
================================
Contained within this repo is an automated one command script to create (and delete) a Red Hat Open Shift cluster on AWS known as ROSA as detailed in the install document below:<br> 
<br>
https://docs.isovalent.com/ink/install/rosa.html#<br>
<br>
The Open Shift (ROSA) Cluster will not have a cni installed and is ready for the installation of Cilium and Isovalent solutions.
<br>
<br>
This repo will do the following <br>
<br> 
1 - Log you into the Red Hat portal to obtain a token <br /> 
2 - Create on AWS an OIDC provider, and create ManagedOpenShift Accounts and Operator roles<br /> 
3 - Clone a Terrform repo needed to create a VPC, update the terraform files and then create the VPC on AWS<br /> 
4 - Intoragate AWS for the SUBNET_IDS needed and create some env variables<br /> 
5 - Create the ROSA Open Shift Cluster<br /> 
6 - Run checks against the Open Shift Cluster<br /> 
7 - Create an Admin user for the Open Shift Cluster and then auto log you in<br /> 
8 - Check you are sucessfully logged in as the Admin user<br />
9 - Check the status of your worker nodes<br /> 
<br> 
<br>

Steps to install<br /> 
======================
<br /> 
1 - Make sure you have all the prerequisites listed in the link below,<br>
<br>A VERY IMPORTANT PRE-REQ IS TO HAVE A REDHAT ACCOUNT AND HAVE THAT LINKED TO YOUR AWS ACCOUNT <br />
https://docs.isovalent.com/ink/install/rosa.html#prerequisites <br />
<br />
2 - Clone this repo <br />
<br />
3 - You now change 1 file - the 0-env.sh file <br />
<br /> 
    - Navigate to the 0-env.sh file and change the variables to your requirement, this is the only change you need to make, as shown in the image below <br /> 
    <br /> 
     <img width="452" height="255" alt="image" src="https://github.com/user-attachments/assets/9937826c-b509-4464-ba55-d3a79b57575a" />
  <br />
  <br>
  
4 - Once you have completed the changes above, now run the following command from your terminal:<br />
<br />
source 00-create-all.sh<br /> 
<br>
<img width="612" height="78" alt="image" src="https://github.com/user-attachments/assets/fb0b930b-0705-4c2c-b22b-c76bf2cd1887" />
<br>
<br />
5 - The script will now create all as follows:<br>
    the 
<br /> 
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
