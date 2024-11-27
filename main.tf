provider "aws" {
    region = "us-east-1"
  
}

resource "aws_instance" "bikenweb" {
    ami           = "ami-0866a3c8686eaee"
  instance_type = "t2.micro"
  subnet_id = "subnet-0174facdb97e9584d"
}


