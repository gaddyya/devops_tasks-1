resource "aws_db_subnet_group" "db_subnets_group" {
  name       = "db_subnet_group"
  subnet_ids = var.subnets_id

  tags = {
    Name = "db_subnet_group"
  }
}

resource "aws_db_parameter_group" "db_pg" {
  name   = "aws-db-parameter-group"
  family = "postgres14"
}

resource "aws_db_instance" "postgres" {
  identifier             = "postgresql-db"
  instance_class         = "db.t3.micro"
  allocated_storage      = 20
  max_allocated_storage  = 100
  engine                 = "postgres"
  engine_version         = "14.1"
  username               = "postgres"
  password               = var.db_password
  db_subnet_group_name   = aws_db_subnet_group.db_subnets_group.name
  vpc_security_group_ids = var.vpc_sg_id
  parameter_group_name   = aws_db_parameter_group.db_pg.name
  skip_final_snapshot    = true
  multi_az               = true
}
