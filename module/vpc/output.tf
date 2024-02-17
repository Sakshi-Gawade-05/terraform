output "aws_security_group"{
    value = aws_security_group.my_security.id
}

output "aws_subnet" {
    value = aws_subnet.public_sub.id
}