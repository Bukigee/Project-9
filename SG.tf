# Configure the Security Group
resource "aws_security_group" "P9-SG" {
  name        = "P9-SG"
  description = "HTTP Access"
  vpc_id      = aws_vpc.P9-VPC.id

  ingress {
    description      = "HTTP from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    
  }

  tags = {
    Name = "P9-SG"
  }
}