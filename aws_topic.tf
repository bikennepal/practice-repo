How to create aws CI/CD pipeline in aws:
url https://www.geeksforgeeks.org/how-to-build-a-ci-cd-pipeline-with-aws/#what-are-the-aws-cicd-pipeline-components
1.crate a role for ec2 instance to access s3 bucket as read only access
2. create a role for awscodedeploy to deploy code
3.create an ec2 instance and install below needed apps and 
	sudo su
	sudo yum update
	sudo yum install ruby
	sudo yum install wget
	wget https://aws-codedeploy-us-east-1.s3.amazonaws.com/latest/install
	chmod +x ./install
	sudo ./install auto
	sudo service codedeploy-agent status
	
	



=======================================================================
//What is vpc flow logs and what it help to improve in our system: VPC flow logs are a feature that records and analyzes network traffic for a Virtual Private Cloud (VPC)
// some insights learning of aws on vpc flow logs
// practical demo of creating vpc flow log

/// to install nginx script
    #!/bin/bash
sudo apt update
sudo apt install nginx
sudo systemctl restart nginx
sudo systemctl status nginx
///

//something related to instance level security group you need to check and give access
//create s3 to capture flow logs and associate flow logs in vpc along with s3 bucket arn
// to test write a small test script
//while true
    do
    curl instandns | grep -i nginx
    sleep 1
    done
//
/////////////// implemented AWS VPC peering by creating two vpc in same region.
    Why VPC peering is needed and how it solves the problem.
//////aws vpc endpoint: why it is needed and what problems it solve
/// VPC endpoints allow communication between resources in a VPC and services without exposing the VPC to the public internet. They also simplify network management by reducing the need for other connections.
 Steps for implementing: create one s3 bucket and try to access that bucket resource from the public and private instance from a VPC.
interface ednpoint and gateway endpoint.

################################################################
Security Group Vs NACL(Network Access control list)
Before to this above topic know about firewall
Stateful firewall Vs Stateless Firewall:
In stateful firewall the traffic comes and goes through same port while in stateless the traffic goes though port and comes thorough different path and we need open one sepraate port for outgoing traffic
SG is stateful and it does not have deny rule NACL is stateless and we have both allow and deny rule.
create one vpc along with deploy instance and test the NACL and security group

#####################################################################
Day 08 Multi-Region Connectivity: Transit Gateway & Three VPCs Deep Dive.
==> Amazon VPC Transit Gateways is a network transit hub used to interconnect virtual private clouds (VPCs) and on-premises networks.
create a 2vpc with one pubsubnet and 0 private subnet for each VPCs
create security group for each VPC with all traffic allowed
create Transit gateway and after it attached TGW to each VPC
launch one each instance in each 'vpc 192.168.3.112   10.0.3.25
create route table for each vpc and attached oen with other using transit gateway
jump to ohio region and create VPC check SG launch instance create TGW attach it 
create route in ohio for both vpc and go to NV and add route of ohio in both routes vpc
create transit gateway attachment and select peering connection instead of vpc and accept request from NV region
go to transit gateway route table and enter for both vpc ids and do same in NV as well for OHIO PVC 
Do once again to better understand
========================================================================
Day 09 EC2 | Cost-Saving Strategies and Instance Types Explained:
tpes of ec2 instances:
spot,on-demand-reserved,launch-template implementing 
==========================================================================
Day 11 AWS Storage: EBS, File Storage, and Object Storage Explained:
Block Storage are of two types:
instance storage and EBS volumes:
Instance storage is temporary and in under /root 
in EBS we can attach and detach the volume for later use but within the region not other than one region.
implementation/practical steps:
ceate one large instance type of large and add volume in the volume section one 4gb and other 2gb and create instance
2. create two dir example as below:
	mkdri -p ivol
	mkdir -p ibvol
	
3. create disk partition of above added volume  for both
	fdisk /dev/xvdb
	makefilesystem: mkfs.ext4 /dev/xvdb1
	mount oabove create dir in both
	mount /dev/xvdb1 ivol/
	add in vi /ect/fstab for permanent mounting
	cd to one dir and download file 
	cd ibol/
   32  wget https://releases.hashicorp.com/terraform/1.10.3/terraform_1.10.3_linux_amd64.zip
   and restart the isntance and check if data available or not 
File storages types:
EFS(elastic file storage for linux)
EFX(for windows storage)
S3 Types: 
s3 object storage(unstructured data) and archival know as glacier
=================================================================
Day 10 Automate Your AWS-AMI with HashiCorp Packer:
Packer is a community tool for creating identical machine images for multiple platforms from a single source configuration
Packer is an open-source tool that automates the creation of identical machine images for multiple platforms from a single source configuration

===============================================================
Day 12 Creating a Scalable NLB Project with EC2, VPC, Route 53, and SSL Certificate Manager:
Loadbalancer types: Regional base and VPC base load balancer
Global LB and APP,Network LB in VPC label
create VPC with three each subnets as private no public here 
create SG with proper rule of traffic that is https,http,all,ssh and create 1 instance each in 1 private subnet.
   on server-1
	#!/bin/bash
		sudo apt update
		sudo apt install nginx -y
		sudo systemctl restart nginx
		sudo systemctl enable nginx
		echo "<h1>$(cat /etc/hostname)</h1>" >> /var/www/html/index.nginx-debian.html
		echo "<h1>US-EAST-1A-SERVERS</h1>" /var/www/html/index.nginx-debian.html
		
After creating all three private instances create target groups. and attached it wiht private instance later
create loadbalancer now.
before performing all the above steps you should have one domain name to implement this POC.
=====================================================================
Day 13 ALB | AWS ALB Project Walkthrough | Private Subnets | Route53:
1.generate one ACM
2.create VPC with three each subnets as private no public here 
3.3 private instances and while crating instances update user data 
4. create TG here create 3 TG as it should route on each one
5.create ALB
6.route53
7.redirection http to https
8.path base routing
9.both on movie instance as well as home page
Implement in practical
====================================================================
Day 14 Real Time Autoscaling Group configuration with SNS Route53 ALB Target Groups Alarms:
1.AutoScaling group
= a.Vertical and horizantal Scaling.

Steps for implementation/practical
1.VPC,SG,TG,LB,route53,sns,AG-dynamic,alaram,policy
for this Demo create one AMI that is customer AMI for this demo to implement
=====================================================================
Day 15 Route 53 | Latency | Weighted | Geo Location | Failover | ‪@SaiKirannPinapathruni‬
create two instance in us and india Region and install one small script that you have above
2.create two helath checks for each above instances
3.create failover routing policy in route53,hosted zone for both instance above un record part
Failover routing policy is above implementation/practical
latency-policy:
in the record tyep select latency and create it 
weighted-policy:

=============================================================================
Day 16 WAF | Safeguard Your Site Against DDoS Attacks 🛡️ | ‪@SaiKirannPinapathruni‬
WAR and shield we can filter traffic base on ip address
steps:
1.spin two instances in 1a and 1b
2.TG,LB and Dns to route53
3.WAF, ip address and region instance ip blocking
fantestic i did it.
==============================================================================
Day 17 IAM Policies | A Practical Guide for Secure Resource Access
IAM herarchy format:
create user,roles,policy and usergroup
go to policy generator and check the policy of ec2 instance those you wanted to grant permission
other steps like creating bucket and custom policy creation done 
===============================================================================
Day 18 IAM Roles | Assuming roles | AWS
I want a s3 access but only to a particular bucket and how will you assign a role to a user
-> Implementation steps:
create two instances for testing purpose
create a iam role 
Do this step once againg fully
==============================================
Day 19 Role Switching Role Switching and Active Directory Setup
=> create three different aws account naming Satgign and QA account 
	create 1 role each in Staging and QA account and give administrator role access 
	create two user in main account 
	create usergroup and add above two user to this group 
	after creating group attach policy to the above group 
	after it just try to login in both account using user that has been created and try swirching role for both 
	launch one windows machine and install active directory software below is the step use private key 
	ipconfig /all to check ip address and dns 
	ncpa.cpl 
	fitewall.cpl turn off firewall 
	server manager to install active directory 
	
	=======================================================
Day 20 Active Directory | SSO | Directory Service | AWS Managed AD
create one windows instance 
go to active directory and create one AC services
login to new place instance 
open ncpa.cpl and add two ip address in dns place 
open server manager and seelect "Remote server admin tools-> role admin tools -> AD and ADS and install"
open cmd and type sysdm.cpl "and click change and enter AD dns in domain group "
go to IAM identity center and create one using console 
login with AD service user and password that you have created 
after logging in in cmd type "dsa.msc"
do both one more time
==============================================================
Day 21 RDS MYSQ:
before creating a database create a subnet group 
create mysql database and check the detail service there
create two instance one windows and one linux 
In window instance turnoff firewall policy "firewall.cpl" and turn off 
open server manager and go to local server and turn off E security config 
download chrome in windows server and install visual c++ x64 version 
download sql workbench as well and connect using workbench by using aws endpooint link 
==============================================================
Day 22 Serverless Architecture with AWS: DynamoDB, API Gateway, and Lambda
steps to implement:
create one dynamoDb "create as per your requirement"
open lambda function and create one fuction and grant executable accesss from Iam and run below json 

	{
	"operation": "create",
	"payload": {
		"TableName": "bookstore",
		"Item": {
			"id": 10,
			"author": "Biken",
			"bookname": "Rich Dad",
			"Location": "India",
			"State": "Tispari",
			"Hobbies": {
				"Act1": "Swimming",
				"Act2": "Cycling",
				"Act3": "Writing"
			}
			
		}
	}
}

create API gateway of rest API and add put and post method and deploy it 
download rest api client and test from laptop 

=================================================
Day 23 Amazon Redshift | Data Warehousing | S3 | QuickSight
AWS redshift is use to handle large dataset and for fast processing of data
create one windows instance and install REDshift workbench and install java 8 as well.
create reshift cluster selecting your subnet group 
create s3 bucket for storing sample data  and upload some sample data in s3 bucket 
get the sample data from the github and downlaod workbench in local and copy and extrat in remote and add the config there what ever required 
have to again 
================================================
Day 24 Setting Up S3 Storage with CloudFront | ACM | Route53 for High-Performance Websites
create one bucket and enable bucket versoning 
enable static hosting in the bucket 
open DCN and create one and deploy s3 portfolio
==================================================
Day 25 S3 Policies | Access Points | S3Fs:
create one ubuntu instance for the purpose of using s3fs third party tool
create s3 and block all public access but provide custom access using policy generater or using policy generator
upload some files in s3 bucket 
open policy generator and generate policy 
we can check preassigned url from the console from actions part 
create two folder inside a bucket and grant one folder each permission to the two user using access point 
create two user don't assign any policy for now and login to that user 
create one access point and you have to grant premission to the user at the bucket level 
====================================================
Day 26 AWS Glacier & EFS. LongTerm Storage and Elastic File System Explained
create two instance and add below userdata while creating
	#!/bin/bash
sudo apt install nfs-common -y
sudo apt update
sudo apt install -y openjdk-8-jdk

create one common directory on master instance 
mkdir /var/lib/jenkins
vi /etc/fstab
create one efs service 
fs-0ba6567478f1367ec.efs.us-east-1.amazonaws.com:/   	/var/lib/jenkins/   	nfs 
don't forget to reboot the system after editing /etc/fstab
install jenkins using below code 

#!/bin/bash
sudo apt-get update -y
sudo apt-get install openjdk-11-jre -y
sudo curl -fsSL https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key | sudo tee   /usr/share/keyrings/jenkins-keyring.asc > /dev/null
sudo echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/ | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null
sudo apt-get update -y
sudo apt-get install fontconfig openjdk-11-jre -y
sudo apt-get install jenkins -y 
sudo systemctl start jenkins
sudo systemctl enable jenkins
sudo systemctl status jenkins
ef4d605a92c3489a82ac0d437ca58500
this is done and dusted
===========================================
Day 27 | Setting Up AWS FSX and Workspaces with Active Directory Integration
Skipped for now will do later
============================================
Day 29 Deploy CloudWatch Agent on AWS Linux | Memory & Disk Space CloudWatch Logs & Dashboards
Launch one ec2 windows instance with t2.large instance type 
create one Adctive directory once active directory is up create one windows fsx 
create one fsx and login to the instance
disable the firewall "firewall.cpl"
make entry of active directory with windows host to sync both instance and AD directory
npca.cpl and add dns and instance host ip
go to server manager and install necessary tool 
After doing the necessary change go to command prompt and "sysdm.cpl" and after system got restarted login with new AD user cred
create two user from the latest cmd dsa.msc 
and create one group and add two user in that group 
open amazon workspace and attach active directory
go to workspce and create ws
to able to make login successful go to rdp machine and enter lusrmgr.msc
=============================================
Day 30 Amazon Event Bridge with Lambda
one task related to user creationg and attaching permission boundry as soon as user created need to check
go to cloud watch and create one rule for testing and select each property carefull while creating and create one lambda function to take of event triggering

=================================================
Day 31 Automating Deployment with Cloud9, CodeCommit, CodeBuild, CodeDeploy, and CodePipeline
Steps to implement 
create cloud9 environment to write a code like in IED 
create nat gateway in piblic subnet and assign one elastic ip
attach nat gt to subnet related route table
open cloud9 instace and clone one repo 
create code commit and push the code to the created repo
create s3 bucket 
open code build and generate one artifact file 
===================================================



 



























	

















  
    
