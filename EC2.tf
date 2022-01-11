# Configure EC2
resource "aws_instance" "P9-EC2" {
   ami           = var.AMI_Var
   count = 1
   instance_type = "t2.micro"
   security_groups = [aws_security_group.P9-SG.id]
   subnet_id = aws_subnet.P9-PubSN1.id
   
  }