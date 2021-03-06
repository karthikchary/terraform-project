resource "aws_db_subnet_group" "vprofile-rds-subgrp" {
    name = "vprofile-rds-subgrp"
    description = "vprofile-rds-subgrp-desc"
    subnet_ids = [module.vpc.private_subnets[0], module.vpc.private_subnets[1], module.vpc.private_subnets[2]]
    tags = {
        Name = "Subnet group for RDS"
    }
}
resource "aws_elasticache_subnet_group" "vprofile-ecache-subgrp" {
    name = "vprofile-elasticache-subgrp"
    description = "vprofile-elasticache-subgrp-desc"
    subnet_ids = [module.vpc.private_subnets[0], module.vpc.private_subnets[1], module.vpc.private_subnets[2]]
    tags = {
        Name = "Subnet group for Elasticache"
    }
}
resource "aws_db_instance" "vprofile-rds" {
    allocated_storage = 20
    storage_type = "gp2"
    engine = "mysql"
    engine_version = "5.6.21"
    instance_class = "db.t2.micro"
    name = var.dbname
    username = var.dbuser
    password = var.dbpass
    parameter_group_name = "default.mysql5.6"
    multi_az = "false"
    publicly_accessible = "false"
    db_subnet_group_name = aws_db_subnet_group.vprofile-rds-subgrp.name
    vpc_security_group_ids = [aws_security_group.vprofile-backend-sg.id]
    skip_final_snapshot = true
    tags = {
        Name = "vprofile-rds-instance"
    }
}

resource "aws_elasticache_cluster" "vprofile-cache" {
    cluster_id = "vprofile-cache"
    engine = "memcached"
    node_type = "cache.t2.micro"
    num_cache_nodes = 1
    port = 11211
    parameter_group_name = "default.memcached1.4"
    subnet_group_name = aws_elasticache_subnet_group.vprofile-ecache-subgrp.name
    security_group_ids = [aws_security_group.vprofile-backend-sg.id]
    tags = {
        Name = "vprofile-cache-cluster"
    }
}

resource "aws_mq_broker" "vprofile-rmq" {
    broker_name = "vprofile-mq-broker"
    engine_type = "ActiveMQ"
    engine_version = "5.15.0"
    host_instance_type = "mq.t2.micro"
    auto_minor_version_upgrade = "true"
    publicly_accessible = "false"
    security_groups = [aws_security_group.vprofile-backend-sg.id]
    subnet_ids = [module.vpc.private_subnets[0]]
    user {
        username = var.rmquser
        password = var.rmqpass
    }
    
}