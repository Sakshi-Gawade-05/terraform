resource "aws_instance" "my_instance" {
  ami                     = var.ami
  instance_type           = var.instance_type
  key_name                = var.key_name
  security_group_id         =[var.security_group_id]
  subnet_id               =var.subnet_id 
  tags ={
    name = "var.project"
  }  
}