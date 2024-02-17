provider "aws" {
    region = "ap-south-1"
}

module "vpc" {
    source = "./module/vpc"
    vpc_cidr_block     = var.vpc_cidr_block
    project            = var.project
    public_cidr_block  = var.public_cidr_block
    private_cidr_block = var.private_cidr_block
    from_port          = var.from_port
    to_port            = var.to_port
}
module "ec2" {
    source = "./module/ec2"
    ami               = var.ami
    instance_type     = var.instance_type
    key_name          = var.key_name
    security_groups   = module.vpc.aws_security_groups
    subnet_id         = module.vpc.aws_subnet
}