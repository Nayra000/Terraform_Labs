resource "aws_elasticache_subnet_group" "redis_subnet_group" {
  name       = "redis-private-subnet-group"
  subnet_ids = [aws_subnet.subnets["private_subnet1"].id, aws_subnet.subnets["private_subnet2"].id]

  tags = {
    Name = "Redis Subnet Group"
  }
}

resource "aws_elasticache_cluster" "redis" {
  cluster_id           = "my-private-redis"
  engine               = "redis"
  engine_version       = "7.0"
  node_type            = "cache.t3.micro"
  num_cache_nodes      = 1
  parameter_group_name = "default.redis7"
  subnet_group_name    = aws_elasticache_subnet_group.redis_subnet_group.name
  security_group_ids   = [aws_security_group.redis_sg.id]
}

