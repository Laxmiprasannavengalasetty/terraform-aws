resource "aws_instance" "terraform" {
  ami                    = "ami-09c813fb71547fc4f"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow-ssh-terraform.id]
  tags = {
    Name = "terraform"
  }
  # local exec means it will install locally means laptop  and it will print public_ip's in given txt file
  provisioner "local-exec" {
    command = "echo ${self.private_ip} >> public_ips.txt"
  }
 # remote_exec  it will execute at the time of creation , it will connect to the public _ip host and install nginx and ansible
  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }
  provisioner "remote-exec" {
    inline = [      #run multiple commands
        "sudo dnf install nginx -y ",
        "sudo dnf install ansible -y ",
        "sudo systemctl start nginx"
    ]
}
provisioner "remote-exec" {
  when = destroy        # stop service then destroy
    inline = [      
        "sudo systemctl stop nginx"
    ]

}
}
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
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }
ingress {
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"] # allow from everyone
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "allow-ssh-terraform"
  }
}

