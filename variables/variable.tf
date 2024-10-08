#variables preferance
#1. command line arguments
#2. terraform.tfvars
#3. environment variables      export_TF_VAR_instance_type=t3.xlarge
#4. default
#5. prompt  #it will ask datatype in cmd line


variable "ami_id" {
  type    = string
  default = "ami-09c813fb71547fc4f"
  description = "This is the AMI ID of DevOps RHEL 9"
}

variable "instance_type"{
   type = string
   default = "t3.micro"
   description = "This is type of instance type"   #optional

}

 variable "tags"{
   type = map      #optional it takes as a map
   default =  {
     Name = "backend"
     Project = "expense"
     Component = "DEV"
     terraform = "true"
   }
 }

 variable "sg_name"{
    default = "allow-ssh-tf"

 }

 variable "sg_description"{
  default = "allow port no. 22 for ssh access"

 }
 variable "from_port"{
   default = 22
   type = number

 }
  variable "to_port"{
   default = 22
   type = number

 }
 variable "protocol"{
   default = "tcp"
  

 }
  
 variable "ingress_cidr_blocks"{
   default = ["0.0.0.0/0"]
   type = list(string)

 }