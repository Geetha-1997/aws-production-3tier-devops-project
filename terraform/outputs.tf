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

output "alb_dns_name" {
  value = module.alb.alb_dns_name
}

output "alb_arn" {
  value = module.alb.alb_arn
}

output "bastion_public_ip" {
  value = module.bastion.public_ip
}

output "database_endpoint" {
  value = module.rds.db_endpoint
}
output "database_name" {

  value = module.rds.db_name

}

output "sns_topic_arn" {
  value = module.sns.topic_arn
}

output "sqs_queue_url" {
  value = module.sqs.queue_url
}
output "cpu_alarm_name" {

  value = module.cloudwatch.cpu_alarm_name

}

output "cpu_alarm_arn" {

  value = module.cloudwatch.cpu_alarm_arn

}