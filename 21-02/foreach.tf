provider "aws" {
    region = "ap-south-1"
}

resource "aws_instance" "instance" {
for_each = toset(var.ami_id)
    ami = each.value
    instance_type = "t2.micro"
    key_name = "demo"
    tags = {
        Name = "for_each"
    }
}

variable "ami_id" {
   default = ["ami-0e670eb768a5fc3d4","ami-06b72b3b2a773be2b","ami-05a5bb48beb785bf1", "ami-05a5bb48beb785bf1"] 
}