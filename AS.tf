# Configure the Auto Scaler
resource "aws_launch_configuration" "P9-AS" {
  name_prefix   = "P9-AutoScaler"
  image_id      = var.AMI_Var
  instance_type = "t2.micro"

  lifecycle {
    create_before_destroy = true
  }
}