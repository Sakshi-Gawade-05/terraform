output "vpc_security_group_ids"{
    value = aws_security_group.my_security.id
}

output "aws_subnet" {
    value = aws_subnet.public_sub.id
}