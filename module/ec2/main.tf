resource "aws_instance" "my_instance" {
  ami                     = var.ami
  instance_type           = var.instance_type
  key_name                = var.key_name
  security_group_ids        =[var.security_group_ids]
  subnet_id               =var.subnet_id 
  tags ={
    name = "var.project"
  }  
}