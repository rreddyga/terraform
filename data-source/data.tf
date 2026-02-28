data "aws_ami" "joindevops" {
    most_recent =  true
    owners = ["358294946186"]
            

    filter {
        name = "name"
        values = ["Redhat-9-DevOps-Practice"]
    }

     filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
}