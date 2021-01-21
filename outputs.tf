output "public_dns" {
  value = aws_instance.ubuntu[1].public_dns
}

output "instance_id" {
  value = aws_instance.ubuntu[1].id
}
