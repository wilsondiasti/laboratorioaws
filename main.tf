terraform {
        required_providers {
            aws = {
              source = "hashicorp/aws"
              version = "~> 3.0"
              }
        }
}
#Configurando o provedor
provider "aws" {
  region  = "us-east-1"
}

#Configurando minhas instancias
resource "aws_instance" "elastic" {
  count         = 3
  ami           = "ami-0885b1f6bd170450c"
  instance_type = "t2.small"
  key_name      = "elastic"
  tags = {
    Name = "elastic${count.index}"
  }
#vpc_security_group_ids = ["sg-0","sg-0","sg-d"]
}

resource "aws_instance" "server" {
  count         = 1
  ami           = "ami-0885b1f6bd170450c"
  instance_type = "t2.micro"
  key_name      = "elastic"
  tags = {
    Name = "server${count.index}"
  }
#vpc_security_group_ids = ["sg-0","sg-0","sg-d"]
}

#Liberando porta 22
resource "aws_security_group" "acesso_ssh" {
  name        = "acesso_ssh"
  description = "Liberando acessos aos servidores via SSH"

  ingress {

    from_port   = 22
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Acesso SSH"
  }
}

#Liberando porta 5601 e 9200
resource "aws_security_group" "acesso_http" {
  name        = "acesso_http"
  description = "Liberando acessos aos servidores via SSH"

  ingress {

    from_port   = 5601
    to_port     = 5601
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {

    from_port   = 9200
    to_port     = 9200
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Acesso Http"
  }
}