resource "aws_instance" "my_instance" {
  ami                     = var.ami
  instance_type           = var.instance_type
  key_name                = var.key_name
  vpc_security_group_ids  =[var.vpc_security_group_ids ]
  subnet_id               =var.subnet_id 
  tags ={
    Name = "var.project"
  }  
}