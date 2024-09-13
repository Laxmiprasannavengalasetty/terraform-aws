variable "instance_names" {
  type        = list(string)
  default     = [ "mysql", "backend", "frontend" ]
  description = "description"
}

variable "common_tags"{
   type  = map
   default = {
       project = "expense"
       environment = "dev"
       terraform = "true"
  }

}
variable "zone_id"{
   default = "Z0611814E52U7VHECUW0"
}
variable "domain_name"{

    default = "lpdevops.online"
}