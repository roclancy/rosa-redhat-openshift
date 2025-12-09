RedHat Openshift on AWS
===================
<img width="1495" height="825" alt="image" src="https://github.com/user-attachments/assets/bd77e032-715c-46fe-9743-a6a0010793c5" />
<br>

What this script will do <br /> 
================================
Contained within this repo is a script to download and run to install Isovalent enterprise and Hubble Timescape (lite) UI using the various helm charts 
Isovalent Base install Document which this script is based on:<br /> 
https://docs.isovalent.com/v1.17/operations-guide/installation/eks-install.html#<br /> 
<br /> 
This repo will do the following <br /> 
<br /> 
1 - Check you have Isovalent Helm charts installed, and make sure they are up todate <br /> 
2 - Create an AWS EKS cluster with CNI disabled<br /> 
3 - Install the Prometheus metrics CRD on the EKS cluster<br /> 
4 - Install Isovalent enterprise using Helm Charts<br /> 
5 - Create an EKS node group<br /> 
6 - Install DNS-HA<br /> 
7 - Install Hubble Timescape (lite)<br /> 
8 - Enable port forwarding to access the Hubble Timescape (lite) UI<br /> 
<br /> 
Once installed you can access the UI with URL http://127.0.0.1:12000/<br /> 
<br />
<br />
Below is a list of the versions used  - full list here - https://helm.isovalent.com/ <br>
- Cilium - 1.18.4<br>
- Cilium-dns - 1.18.4<br>
- Hubble-enterprise - 13.2<br>
- Hubble-timescape - 1.18.1<br>
- Tetragon - 1.18.0<br>
- Tetragon-policies - 1.18.0<br>
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
