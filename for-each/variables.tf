variable "instances" {
    type = map
    default = {
        mangodb = "t3.micro"
        redis = "t3.micro"
        mysql = "t3.small",
        catalogue = "t3.micro"
        cart = "t3.micro"
    }
}
variable "zone_id" {
    default = "Z0853835SDE0JTKZUUR2"
}

variable "domain_name" {
    default = "sanathananelaform.online"
}