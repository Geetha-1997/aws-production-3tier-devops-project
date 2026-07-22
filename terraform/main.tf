##############################################
# VPC Module
##############################################

module "vpc" {

  source = "./modules/vpc"

  project_name = var.project_name
  environment  = var.environment

  vpc_cidr = var.vpc_cidr

}

##############################################
# Subnets Module
##############################################

module "subnets" {

  source = "./modules/subnets"

  project_name = var.project_name
  environment  = var.environment

  vpc_id = module.vpc.vpc_id

  availability_zones = var.availability_zones

  public_subnet_cidrs = var.public_subnet_cidrs

  private_app_subnet_cidrs = var.private_app_subnet_cidrs

  private_db_subnet_cidrs = var.private_db_subnet_cidrs

}

##############################################
# Internet Gateway
##############################################

module "internet_gateway" {

  source = "./modules/internet-gateway"

  project_name = var.project_name
  environment  = var.environment

  vpc_id = module.vpc.vpc_id

}

##############################################
# Elastic IP
##############################################

module "elastic_ip" {

  source = "./modules/elastic-ip"

  project_name = var.project_name
  environment  = var.environment

}

##############################################
# NAT Gateway
##############################################

module "nat_gateway" {

  source = "./modules/nat-gateway"

  project_name = var.project_name
  environment  = var.environment

  allocation_id = module.elastic_ip.allocation_id

  public_subnet_id = module.subnets.public_subnet_ids[0]

}

##############################################
# Route Tables
##############################################

module "route_tables" {

  source = "./modules/route-tables"

  project_name = var.project_name
  environment  = var.environment

  vpc_id = module.vpc.vpc_id

  internet_gateway_id = module.internet_gateway.internet_gateway_id

  nat_gateway_id = module.nat_gateway.nat_gateway_id

  public_subnet_ids = module.subnets.public_subnet_ids

  private_app_subnet_ids = module.subnets.private_app_subnet_ids

  private_db_subnet_ids = module.subnets.private_db_subnet_ids

}

##############################################
# Security Groups
##############################################

module "security_groups" {

  source = "./modules/security-groups"

  project_name = var.project_name
  environment  = var.environment

  vpc_id = module.vpc.vpc_id

  my_ip = var.my_ip

}

##############################################
# IAM Module
##############################################

module "iam" {

  source = "./modules/iam"

  project_name = var.project_name
  environment  = var.environment

}

##############################################
# Bastion Host
##############################################

module "bastion" {

  source = "./modules/bastion"

  project_name = var.project_name
  environment  = var.environment

  ami_id = var.bastion_ami

  instance_type = var.bastion_instance_type

  public_subnet_id = module.subnets.public_subnet_ids[0]

  security_group_id = module.security_groups.bastion_security_group_id

  key_name = var.key_name

  iam_instance_profile = module.iam.instance_profile_name

}
##############################################
# Target Group
##############################################

module "target_group" {

  source = "./modules/target-group"

  project_name = var.project_name
  environment  = var.environment

  vpc_id = module.vpc.vpc_id

}
##############################################
# Application Load Balancer
##############################################

module "alb" {

  source = "./modules/alb"

  project_name = var.project_name

  environment = var.environment

  vpc_id = module.vpc.vpc_id

  public_subnet_ids = module.subnets.public_subnet_ids

  security_group_id = module.security_groups.alb_security_group_id

}
##############################################
# ALB Listener
##############################################

module "alb_listener" {

  source = "./modules/alb-listener"

  alb_arn = module.alb.alb_arn

  target_group_arn = module.target_group.target_group_arn

  certificate_arn = var.certificate_arn

}
######################################################
# Auto Scaling Group
######################################################
##############################################
# Launch Template
##############################################

module "launch_template" {

  source = "./modules/launch-template"

  project_name = var.project_name
  environment  = var.environment

  ami_id = var.app_ami

  instance_type = var.app_instance_type

  security_group_id = module.security_groups.app_security_group_id

  iam_instance_profile = module.iam.instance_profile_name

  key_name = var.key_name

}
module "autoscaling" {

  source = "./modules/autoscaling"

  project_name = var.project_name
  environment  = var.environment

  launch_template_id = module.launch_template.launch_template_id

  private_subnet_ids = module.subnets.private_app_subnet_ids

  target_group_arns = [
    module.target_group.target_group_arn
  ]

  desired_capacity = 2
  min_size         = 2
  max_size         = 4
}
######################################################
# RDS
######################################################

module "rds" {

  source = "./modules/rds"

  project_name = var.project_name
  environment  = var.environment

  db_name     = var.db_name
  db_username = var.db_username
  db_password = var.db_password

  db_subnet_ids = module.subnets.private_db_subnet_ids

  security_group_id = module.security_groups.rds_security_group_id

}
######################################################
# Route53
######################################################

module "route53" {

  source = "./modules/route53"

  project_name = var.project_name
  environment  = var.environment

  hosted_zone_id = var.hosted_zone_id

  domain_name = var.domain_name

  alb_dns_name = module.alb.alb_dns_name

  alb_zone_id = module.alb.alb_zone_id

}
module "cloudwatch" {

  source = "./modules/cloudwatch"

  project_name = var.project_name
  environment  = var.environment

  autoscaling_group_name = module.autoscaling.autoscaling_group_name

  sns_topic_arn = module.sns.topic_arn

}
######################################################
# SNS
######################################################

module "sns" {

  source = "./modules/sns"

  project_name = var.project_name
  environment  = var.environment

  notification_email = var.notification_email

}
######################################################
# SQS
######################################################

module "sqs" {

  source = "./modules/sqs"

  project_name = var.project_name

  environment = var.environment

}