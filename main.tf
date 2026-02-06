module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  public_subnet_cidrs = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  environment = var.environment
}

module "security" {
  source = "./modules/security"
  vpc_id = module.vpc.vpc_id
  my_ip = var.my_ip
}

module "keypair" {
  source = "./modules/keypair"
  public_key_path = var.public_key_path
  key_name = var.key_name
}

module "ec2" {
  source = "./modules/ec2"
  subnet_id = module.vpc.public_subnet_ids[0]
  instance_type = var.instance_type
  security_group_id = module.security.ec2_sg_id
  key_name = module.keypair.key_name
  environment = var.environment
}

module "alb" {
  source = "./modules/alb"
  vpc_id = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
  alb_sg_id = module.security.alb_sg_id
  instance_id = module.ec2.instance_id
}
