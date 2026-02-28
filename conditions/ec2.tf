resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.environment =="dev" ? "t3.micro": "t3.small"
  # have to use created security need to attach to ec2-instance
  vpc_security_group_ids = [ aws_security_group.allow_tls.id]

  tags = var.ec2_tags
}
#security group creation steps to create sg, inbound and outbound traffic

resource "aws_security_group" "allow_tls" {
  name        = var.sg_name # security group name of aws
  description = var.sg_group_description

   egress {
    from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

   ingress {
   from_port        = var.sg_from_port
    to_port          = var.sg_to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }
 
  tags = var.sg_tags

}