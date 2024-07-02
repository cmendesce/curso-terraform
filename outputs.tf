output "public_dns" {
  value = aws_instance.ubuntu[0].public_dns
}

output "instance_id" {
  value = aws_instance.ubuntu[0].id
}
