output "allocate_public_ip" {
  description = "public_ip of ECS instance"
  value       = alicloud_instance.instance.public_ip
}
