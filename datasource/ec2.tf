resource "aws_instance" "expense" {
  
  ami = data.aws_ami.joindevops.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-ssh-terraform.id]
  tags = {
    Name =  "terraform"
  }

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

}
