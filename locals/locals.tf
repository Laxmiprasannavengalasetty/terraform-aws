locals {
  domain_name = "lpdevops.online"
  zone_id = "Z0611814E52U7VHECUW0"   
  instance_type = var.environment == "prod" ? "t3.small" : "t2.micro"
                                        # we cant keep instances name here because count is not work in locals but we can keep expressions
}
 