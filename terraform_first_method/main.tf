module "myapp-vpc" {
  source            = "./modules/vpc"
  subnet_cidr_block = var.subnet_cidr_block
  avail_zone        = var.avail_zone
  env_prefix        = var.env_prefix
  vpc_cidr_block    = var.vpc_cidr_block
}

module "myapp-security-group" {
  source     = "./modules/security_group"
  env_prefix = var.env_prefix
  my_ip      = var.my_ip
  vpc_id     = module.myapp-vpc.vpc.id
}

module "myapp-server" {
  source                    = "./modules/ec2"
  avail_zone                = var.avail_zone
  env_prefix                = var.env_prefix
  instance_type             = var.instance_type
  subnet_id                 = module.myapp-vpc.subnet.id
  default_security_group_id = module.myapp-security-group.security_group.id
  key_name                  = var.key_name
}