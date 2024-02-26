variable "instanceType"{
    type= string
    default = "t2.micro"
}

variable "instanceTagName"{
    type = string
    default = "GFGTerraform"
}

variable "amiID"{
    type = string
    default = "ami-0449c34f967dbf18a"
}

variable "x"{
   default =5
}

variable "keyname"{
    default = "mygfgkey"
}

variable "sg_name"{
    default = "mygfgterraformsg"
}

variable "sg_allowed_port"{
    type = list
    default = [80,8080,9000]
}