network_security_group_name = "sneha-sg"
instance                    = "t2.micro"
instance_count              = 1
ami_id                      = "ami-08a0d1e16fc3f61ea"
subnet_id                   = "subnet-0639d260294d92a5d"
vpc_id                      = "vpc-03d964f7cd3fa2c74"
iam_instance_profile        = "sneha-role"
user_data                   = "/Users/snehatuladhar/Downloads/deploy-application-using-terraform-and-ansible-INTERN-747/amisneha.pem"
key_name                    = "amisneha"
