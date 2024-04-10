provider "aws" {
  region = "us-east-1"
}

/*
resource "aws_instance" "myec2" {
  ami = "ami-0f403e3180720dd7e"
  instance_type = "t2.micro"
  count = 3
}
*/
variable "elb_names" {
    type = list
    default = ["prod-loadbalancer","dev-loadbalancer","stage-loadbalancer"]
  
}

resource "aws_iam_user" "lb" {
  name = var.elb_names [count.index]
  path = "/system/"
  count = 3
}

