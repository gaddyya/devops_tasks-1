provider "aws" {
  region = "eu-west-2"
}

module "vpc-study" {
  source = "../modules/aws_network"
  env    = "study"


}

module "vpc-sg-private" {
  source             = "../modules/aws_securitygroup"
  sg_name            = "Private sg"
  sg_description     = "HTTPS-HTTP + SSH(local)"
  allow_ports_public = ["443", "80"]
  allow_ports_secure = ["22"]
  vpc_id             = module.vpc-study.vpc_id
  vpc_cidr_secure    = module.vpc-study.vpc_cidr

}

module "vpc-sg-public" {
  source             = "../modules/aws_securitygroup"
  sg_name            = "Public sg"
  sg_description     = "HTTP+HTTPS+SSH"
  allow_ports_public = ["22", "443", "80"]
  vpc_id             = module.vpc-study.vpc_id
  vpc_cidr_secure    = module.vpc-study.vpc_cidr

}

module "vpc-sg-db" {
  source             = "../modules/aws_securitygroup"
  sg_name            = "Database sg"
  sg_description     = "POSTGRES"
  allow_ports_public = ["5432"]
  allow_ports_secure = ["22"]
  vpc_id             = module.vpc-study.vpc_id
  vpc_cidr_secure    = module.vpc-study.vpc_cidr
}

output "vpc_cidr_block_study" {
  value = module.vpc-study.vpc_cidr
}

output "vpc-study_id" {
  value = module.vpc-study.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc-study.public_subnets_ids
}

output "vpc-sg-public_id" {
  value = module.vpc-sg-private.security_groups_ids
}

output "vpc-sg-private_id" {
  value = module.vpc-sg-private.security_groups_ids
}

output "vpc-sg-db_id" {
  value = module.vpc-sg-db.security_groups_ids
}
