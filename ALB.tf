#Configure the Application Load Balancer
resource "aws_lb" "P9-ALB" {
  name               = "P9-ALB"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.P9-SG.id]
  subnets            = [aws_subnet.P9-PubSN1.id, aws_subnet.P9-PubSN2.id]

  enable_deletion_protection = false
}

# Configure the LB Target Group
resource "aws_lb_target_group" "P9-LBTG" {
  name     = "P9-LBTG"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.P9-VPC.id
}