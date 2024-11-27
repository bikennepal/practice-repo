provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "bikenweb" {
    ami           = "ami-0866a3c8686eaee"
  instance_type = "t2.micro"
  subnet_id = "subnet-0174facdb97e9584d"
}

resource "aws_s3_bucket" "s3_bucket" {
  bucket = "biken-s3-demo-xyz" # change this
}

resource "aws_dynamodb_table" "terraform_lock" {
  name           = "terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
//go to codespace and configure it to launch aws resources using below commands
//click and give > dev
//configure dev configuraiton
//use current 
// > dev 
// 

