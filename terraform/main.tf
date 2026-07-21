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

  source = "./modules/internet_gateway"

  project_name = var.project_name
  environment  = var.environment

  vpc_id = module.vpc.vpc_id

}

##############################################
# Elastic IP
##############################################

module "elastic_ip" {

  source = "./modules/elastic_ip"

  project_name = var.project_name
  environment  = var.environment

}

##############################################
# NAT Gateway
##############################################

module "nat_gateway" {

  source = "./modules/nat_gateway"

  project_name = var.project_name
  environment  = var.environment

  allocation_id = module.elastic_ip.allocation_id

  public_subnet_id = module.subnets.public_subnet_ids[0]

}

##############################################
# Route Tables
##############################################

module "route_tables" {

  source = "./modules/route_tables"

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

  source = "./modules/security_groups"

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
