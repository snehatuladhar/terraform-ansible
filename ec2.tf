module "ec2" {
  source                      = "./ec2"
  iam_instance_profile        = var.iam_instance_profile
  key_name                    = var.key_name
  subnet_id                   = var.subnet_id
  user_data                   = var.user_data
  vpc_id                      = var.vpc_id
  network_security_group_name = var.network_security_group_name
  instance                    = var.instance
  ami_id                      = var.ami_id
}
resource "null_resource" "ansible" {
  depends_on = [module.ec2]
  provisioner "local-exec" {
    command = <<EOT
    ansible-playbook -i ansible/aws_ec2.yml ansible/playbook.yml -v 
  EOT
  }
}