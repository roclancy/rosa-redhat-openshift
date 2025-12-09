RedHat Openshift on AWS - Ready for Cilium / Isovalent
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
3 - You now change 1 the 0-env.sh file <br />
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
- 1st - it will launch into your Red Hat portal to authenticate (via your browser) you and get a token, if you are not logged in the Red Hat Portal you will need to login with your details, once complete it will display that you are logged in and show the message in the image below, it will automatically move to the next step in the script.<br>

- 2nd - You will be asked to confirm some values, YOU JUST ACCEPT THE DEFAULTS BY ENTERING RETURN, the images below show the point it asks for you, and and after you have entered return, you have to enter return 5 times.<br>
<br>
<img width="1430" height="331" alt="image" src="https://github.com/user-attachments/assets/7268edad-196c-41e2-be64-8a50e76ba89e" /><br>
<img width="1081" height="340" alt="image" src="https://github.com/user-attachments/assets/4c995011-9e9e-4f40-b238-e01aa930dd35" /><br>
<br>

- 3rd - The script will now run and you have no more interaction after this point, when the script ends you will have a ROSA Open Shift Cluster created and all the resources needed built in your AWS account. Images below show the Red Hat Portal and AWS elements created<br>

- 4th The script will auto create a oc Admin account and password and log you into your cluster automatically and print out information to confirm you are logged in and also show the status of the worker nodes created. The worker nodes will be in a "not ready" state, you can now install Cilium after this point.

<img width="1493" height="606" alt="image" src="https://github.com/user-attachments/assets/dc715d43-9cd7-46c1-ad6e-a896fe1ec043" />
<img width="725" height="281" alt="image" src="https://github.com/user-attachments/assets/1f4d5799-0744-47a1-844b-32508bf0bd2d" />
<img width="723" height="280" alt="image" src="https://github.com/user-attachments/assets/fff8dbe4-b8db-45f1-8109-5c265bdcc92c" />
<img width="1239" height="236" alt="image" src="https://github.com/user-attachments/assets/731f5175-8855-48e1-a3a7-4a7cbd49f1ab" />
<img width="613" height="585" alt="image" src="https://github.com/user-attachments/assets/e0589a50-5cd1-445b-97d2-40d585719c6d" />
<img width="576" height="236" alt="image" src="https://github.com/user-attachments/assets/6d48956f-8757-4b9e-976f-78033d762d2e" />

<br /> 
<br />


Steps to DELETE<br /> 
======================
<br> 
1 - run the command shown below,<br>
<br>
 - source delete-rosa-all.sh<br>
<br>
<img width="1407" height="520" alt="image" src="https://github.com/user-attachments/assets/c1b82580-d98a-4837-90e1-aa0d8cfcf1ba" /><br>
<img width="1446" height="464" alt="image" src="https://github.com/user-attachments/assets/35cc7a76-72d0-4d12-9c1b-18758a2a9f9f" /><br>
<br>
it will delete all the following:<br>
<br>
- The ROSA Cluster Managed by Red Hat<br>
- All the AWS config created<br>
- Remove all the new files created in your local copy<br>
- Remove the cloned Terrform directory used to create the VPC<br>
- The only changes that will remain are the changes you made to your 0-env.sh file<br>

