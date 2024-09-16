variable "instances"{

type = map
default = {

    mysql = "t3.small"     # here mysql is key t3.micro value
    backend = "t3.micro"
    frontend = "t3.small"
}
}

variable "zone_id"{
   default = "Z0611814E52U7VHECUW0"
}
variable "domain_name"{

    default = "lpdevops.online"
}