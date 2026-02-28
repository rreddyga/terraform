resource "aws_instance" "example" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  # have to use created security need to attach to ec2-instance
  vpc_security_group_ids = [ aws_security_group.allow_tls.id]

  tags = {
    Project = "roboshop"
    Name = "terraform"
  }
}

#security group creation steps to create sg, inbound and outbound traffic
resource "aws_security_group" "allow_tls" {
  name        = "allow_all_terraform_dynamic-1" # security group name of aws
  description = "Allow TLS inbound traffic and all outbound traffic"

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
# ingress is special variable
   dynamic "ingress" {
    for_each = var.ingress_rules
    content {
        from_port        = ingress.value.port
        to_port          = ingress.value.port
        protocol         = "tcp"
        cidr_blocks      = ingress.value.cidr_blocks
        #ipv6_cidr_blocks = ["::/0"]
        description = ingress.value.description
    }
  }
 
# SSH access (port 22) - allows secure shell access from anywhere

# ingress {
#   from_port        = 22
#   to_port          = 22
#   protocol         = "tcp"
#   cidr_blocks      = ["0.0.0.0/0"]
#   ipv6_cidr_blocks = ["::/0"]
# }
# MySQL database access (port 3306) - allows database connections from anywhere
# ingress {
#   from_port        = 3306
#   to_port          = 3306
#   protocol         = "tcp"
#   cidr_blocks      = ["0.0.0.0/0"]
#   ipv6_cidr_blocks = ["::/0"]
# }
# HTTPS access (port 443) - allows secure web traffic from anywhere
# ingress {
#   from_port        = 443
#   to_port          = 443
#   protocol         = "tcp"
#   cidr_blocks      = ["0.0.0.0/0"]
#   ipv6_cidr_blocks = ["::/0"]
# }



  # for repeatitive task we will use dyamic concept
  tags = {
    Name = "allow_all-terraform"
  }
}