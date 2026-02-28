resource "aws_instance" "example" {
  for_each =  var.instances
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = each.value #"t3.micro"
  # have to use created security need to attach to ec2-instance
  vpc_security_group_ids = [ aws_security_group.allow_tls.id]

  tags = {
    Project = "roboshop"
    Name = each.key #"terraform"
  }
}

#security group creation steps to create sg, inbound and outbound traffic
resource "aws_security_group" "allow_tls" {
  name        = "allow_all_terraform_for_each" # security group name of aws
  description = "Allow TLS inbound traffic and all outbound traffic"

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

   ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
 
  tags = {
    Name = "allow_all-terraform"
  }
}