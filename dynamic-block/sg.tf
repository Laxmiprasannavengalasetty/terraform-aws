resource "aws_security_group" "allow-ssh-terraform" {
  name        = "allow-ssh-tf"
  description = " allow port no. 22 for ssh access"


  # outgoing traffic usally we allow everything in egress not require any permission to go out
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  # incomming traffic  
  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
    from_port        = ingress.value["from_port"]
    to_port          = ingress.value["to_port"]
    protocol         = ingress.value["protocol"]
    cidr_blocks      = ingress.value.cidr_blocks    # both conditions are gives same output above line and this
    }
  }

  tags = {
    Name = "allow-ssh-terraform"
  }
}

resource "aws_instance" "terraform" {
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-ssh-terraform.id]


  tags = {
    Name = "dynamic-block"
  }
}