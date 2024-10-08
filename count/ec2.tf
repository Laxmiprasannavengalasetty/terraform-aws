resource "aws_instance" "backend" {
  count = length([var.instance_names])   # either 3 or this length function can use
  ami = "ami-09c813fb71547fc4f"
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-ssh-terraform.id]
#   tags = {
#     Name = var.instance_names[count.index]
#   }
tags = merge(
    var.common_tags,
    {
         Name = var.instance_names[count.index] #map
    }
)

}
resource "aws_security_group" "allow-ssh-terraform" {
    name = "allow-ssh-tf"
    description= " allow port no. 22 for ssh access"
   

# outgoing traffic usally we allow everything in egress not require any permission to go out
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    }

# incomming traffic  
ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]   # allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }

tags = merge(
    var.common_tags,
    {
         Name = "allow_ssh_terraform"
    }
)
}


