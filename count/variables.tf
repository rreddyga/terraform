variable "instances" {
    type = list
    default = ["mongodb", "redis", "catalogue", "mysql", "rabbitmq", "user", "cart", "shipping", "payment", "frontend"]
}
variable "zone_id" {
    default = "Z0853835SDE0JTKZUUR2"
}

variable "domain_name" {
    default = "sanathananelaform.online"
}

variable "fruit_list" {
    type = list(string)
    default =["apple", "banana","apple","organge"]
}

variable "fruit_set" {
    type = set(string)
    default = ["apple", "banana","apple","organge"]
}