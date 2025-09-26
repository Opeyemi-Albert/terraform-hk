module "web-app" {
  source              = "./modules/web-app"
  region              = var.region
  vpc_cidr            = var.vpc_cidr
  public_subnet_cidr  = var.public_subnet_cidr
  private_subnet_cidr = var.private_subnet_cidr
  instance_type       = var.instance_type
  public_key_path     = var.public_key_path
}
