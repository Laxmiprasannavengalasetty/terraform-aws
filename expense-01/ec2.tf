#here condition for r53 records mysql=t3.small backend=t3.micro frontend = lpdevops.online =3.micro

resource "aws_instance" "terraform" {
  count                  = length(var.instance_names)
  ami                    = data.aws_ami.ami_info.id
  instance_type          = var.instance_names[count.index] == "mysql" ? "t3.small" : "t2.micro" #here mysql = t3.small
  vpc_security_group_ids = [aws_security_group.allow_ssh_terraform.id]


  tags = {
    Name = var.instance_names[count.index]
  }
}
resource "aws_security_group" "allow_ssh_terraform" {
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
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow-ssh-terraform"
  }
}

