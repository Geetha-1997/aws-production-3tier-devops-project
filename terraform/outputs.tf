output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnets" {
  value = module.subnets.public_subnet_ids
}

output "private_app_subnets" {
  value = module.subnets.private_app_subnet_ids
}

output "private_db_subnets" {
  value = module.subnets.private_db_subnet_ids
}

output "bastion_public_ip" {
  value = module.bastion.public_ip
}
