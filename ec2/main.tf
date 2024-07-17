resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance
  iam_instance_profile = var.iam_instance_profile
  key_name = var.key_name
  count         = var.instance_count
  vpc_security_group_ids = [aws_security_group.network-security-group.id]
  subnet_id = var.subnet_id
  user_data = var.user_data

  tags = {
    Name = "ProjectServerInstance ${count.index + 1}"
  }
}
# Creating a security group to restrict/allow inbound connectivity
resource "aws_security_group" "network-security-group" {
  name        = var.network_security_group_name
  description = "Allow TLS inbound traffic"
  vpc_id = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] 
  }
    ingress {
    description = "Node App Port"
    cidr_blocks = ["0.0.0.0/0"]
    from_port   = 3000
    to_port     = 3000
    protocol    = "tcp"
  }
  egress{
    description ="SSM"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] 
  }
  
  tags = {
    Name = "sneha-sg"
  }
}

