resource "aws_instance" "mygfgweb" {
  ami           = "ami-0449c34f967dbf18a"
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}