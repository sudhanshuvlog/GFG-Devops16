resource "aws_instance" "mygfgweb" {
  ami           = data.aws_ami.latest_amazon_linux.id
  instance_type = var.instanceType
  subnet_id   = aws_subnet.mygfgsubnet.id
  tags = {
    Name = "${var.instanceTagName}-${count.index}"
  }
  key_name = var.keyname
  vpc_security_group_ids = [aws_security_group.gfg-web-sg.id]
  depends_on = [aws_key_pair.mykey]
  count= 1
}

resource "aws_key_pair" "mykey" {
  key_name   = var.keyname
  public_key = file("testkeygfg.pub")
}

resource "aws_security_group" "gfg-web-sg" {
  name        = var.sg_name
  description = "Webserver security group allow port 80"
  vpc_id      = aws_vpc.myvpc.id

  dynamic "ingress" {
    for_each = var.sg_allowed_port
    content {
    from_port   = ingress.value
    protocol = "tcp"
    to_port     = ingress.value
    cidr_blocks    = ["0.0.0.0/0"]
  }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}

resource "null_resource" "triggermyscript" {

provisioner "local-exec"{
  command = "echo hiii"
}
}

resource "null_resource" "destroy-resource" {

provisioner "local-exec"{
  when = destroy
  command = "echo destroying the resources > gfgdestroy.txt"
}
}