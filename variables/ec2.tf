
resource "aws_security_group" "allow-ssh-terraform" {
    name = var.sg_name
    description= var.sg_description


# outgoing traffic usally we allow everything in egress not require any permission to go out
egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
    }

# incomming traffic  
#block
ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = var.protocol
    cidr_blocks      = var.ingress_cidr_blocks   # allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }

tags = var.tags
}

resource "aws_instance" "terraform" {
  ami = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow-ssh-terraform.id]
  tags =var.tags
}