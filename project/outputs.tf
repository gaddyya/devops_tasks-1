output "vpc-study_id" {
  value = module.vpc-study.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc-study.public_subnets_ids
}



output "vpc-sg-private_id" {
  value = module.vpc-sg-private.security_groups_ids
}

output "vpc-sg-db_id" {
  value = module.vpc-sg-db.security_groups_ids
}

output "vpc_cidr_block_study" {
  value = module.vpc-study.vpc_cidr
}