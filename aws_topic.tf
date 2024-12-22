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
interface ednpoint and gateway endpoint

  
    
