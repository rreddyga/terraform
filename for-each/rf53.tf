resource "aws_route53_record" "www" {
  #count   = length(var.instances)  
  for_each =  aws_instance.example
  zone_id = var.zone_id
  #name    = "${var.instances[count.index]}.${var.domain_name}"  # mongodb.anathananelaform.online
  name    = "${each.key}.${var.domain_name}"  # mongodb.anathananelaform.online
  type    = "A"
  ttl     = 1
  #records = [aws_instance.example[count.index].private_ip]
  records = [each.value.private_ip]
  allow_overwrite = true
  
}

#to get the public_ip by using lookup functions

resource "aws_route53_record" "www" {
  #count   = length(var.instances)  
  for_each =  aws_instance.example
  zone_id = var.zone_id
  name    = "roboshop.${var.domain_name}"  # roboshop.sanathananelaform.online
  #name    = "${each.key}.${var.domain_name}"  # mongodb.sanathananelaform.online
  type    = "A"
  ttl     = 1
  #records = [aws_instance.example[count.index].private_ip]
  #records = [each.value.private_ip]
  records = [lookup(aws_instance.example,"frontend").public_ip]
  allow_overwrite = true
  
}