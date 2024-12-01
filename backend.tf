terraform {
  backend "s3" {
    bucket         = "biken-s3-demo-xyz" 
    key            = "biken/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-lock"
  }
}