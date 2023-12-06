provider "aws" {
  region = "us-weat-1"
}

resource "aws_instance" "test_servers" {
  count         = 2
  ami           = "ami-080d1454ad4fabd12"
  instance_type = "t2.micro"

  tags = {
    Name = "c8-local-${count.index + 1}"
  }
}

output "ansible_inventory" {
  value = <<EOT
{
  "web_servers": {
    "hosts": [${jsonencode(aws_instance.test_server[*].public_key)}],
    "vars": {
      "ansible_user": "ec2-user",
      "ansible_ssh_private_key_file": "/path/to/private/cats1"
    }
  }
}
EOT
}
