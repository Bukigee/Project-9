# Configure My SQL DB
resource "aws_db_instance" "P9DB" {
  allocated_storage    = 12
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "P9DB"
  username             = "BukiGee"
  password             = "password"
  parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = aws_db_subnet_group.P9-DBSNG.id
  skip_final_snapshot  = true
}

#Configure DB Subnet Group
resource "aws_db_subnet_group" "P9-DBSNG" {
    name = "db-subnet-group"
    subnet_ids = [aws_subnet.P9-PrivSN1.id, aws_subnet.P9-PrivSN2.id]
  tags= {
      Name = "http"
  }
}


#Configure RDS Security Group
resource "aws_security_group" "P9-DBSG" {
  name = "P9-DBSG"
  description = "allow http inbound traffic"
  vpc_id  = aws_vpc.P9-VPC.id
}
  resource "aws_security_group_rule" "DbSG-Inbound" {
  type              = "ingress"
  from_port         = 3306
  to_port           = 3306
  protocol          = "tcp"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.P9-DBSG.id
}

resource "aws_security_group_rule" "DBSG-Outbound" {
  type              = "egress"
  from_port         = 0
  to_port           = 0
  protocol          = "-1"
  cidr_blocks       = ["0.0.0.0/0"]
  security_group_id = aws_security_group.P9-DBSG.id
}