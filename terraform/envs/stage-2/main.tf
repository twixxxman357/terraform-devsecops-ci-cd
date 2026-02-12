provider "aws" {
  region = "ap-northeast-1"
}

module "vpc" {
  source = "../../modules/vpc"

  name       = "stage-2-vpc"
  cidr_block = "10.20.0.0/16"

  public_subnet_cidrs  = ["10.20.1.0/24", "10.20.2.0/24"]
  private_subnet_cidrs = ["10.20.11.0/24", "10.20.12.0/24"]
}

module "alb" {
  source     = "../../modules/alb"
  name       = "stage-2-alb"
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.public_subnet_ids
}

module "asg" {
  source           = "../../modules/asg"
  name             = "stage-2-asg"
  subnet_ids       = module.vpc.private_subnet_ids
  target_group_arn = module.alb.target_group_arn
}

