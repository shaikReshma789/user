resource "aws_instance" "test-server" {
 ami = "ami-080d1454ad4fabd12"
 instance_type = "t2.micro"
 key_name = "cats1"
 tags = {
  Name = "c8-local"
    }
}