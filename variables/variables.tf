variable "ami_id" {
    type = string
    default = "ami-0220d79f3f480ecf5"
    description = "RHEL 9 Image"
}
variable "instance_type" {
    type = string
    default = "t3.micro"
    description = "instance type"
}

variable "ec2_tags" {
    type = map
    default = {
        Name = "variables-demo"
        Project = "roboshop"
        Terraform = "true"
        Environment = "dev"
    }
}

variable "sg_name" {
    default = "allow_all-terraform"
    type = string
}

variable "sg_group_description" {
    default = "Allo TLS inbound and outbound traffic"
    type = string
}

variable "sg_from_port" {
    default = 0
    type = number
}
variable "sg_to_port" {
    default = 0
    type = number
}

variable "cidr_blocks" {
    default = ["0.0.0.0/0"]
    type = list
}

variable "sg_tags" {
    type = map
    default = {
        Name = "allow_all-terraform"
        Project = "roboshop"
        Terraform = "ture"
        Environment = "dev"
    }
}


