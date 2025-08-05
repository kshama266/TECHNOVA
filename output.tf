output "public_ip" {
  value = aws_instance.technovaa_node_app.public_ip
}

output "access_url" {
  value = "http://${aws_instance.technovaa_node_app.public_ip}:3000"
}
