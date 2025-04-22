module "networking" {
  source = "./networking"
  region = var.region
}

module "ec2" {
  source        = "./ec2"
  vpc_id        = module.networking.vpc_id
  public_subnet = module.networking.public_subnet
  sg_rds_id     = module.rds.sg_id
}

/*module "rds" {
  source         = "./rds"
  vpc_id         = module.networking.vpc_id
  private_subnet = module.networking.private_subnet
  sg_ec2_id      = module.ec2.sg_id
}
*/


