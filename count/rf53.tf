resource "aws_route53_record" "www" {
  count   = length(var.instances)  
  zone_id = var.zone_id
  name    = "${var.instances[count.index]}.${var.domain_name}"  # mongodb.sanathananelaform.online
  type    = "A"
  ttl     = 1
  records = [aws_instance.example[count.index].private_ip]
}

# if you want to create public-ip -> roboshop.sanathananelaform.online by using functions we can define

resource "aws_route53_record" "www" {
  count   = length(var.instances)  
  zone_id = var.zone_id
  name    = "roboshop.${var.domain_name}"  # roboshop.sanathananelaform.online
  type    = "A"
  ttl     = 1
  #records = [aws_instance.example[count.index].private_ip]
  records = [aws_instance.example[index(var.instances,"frontend")].public_ip]
}

