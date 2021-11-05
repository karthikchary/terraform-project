variable AWS_REGION {
    default = ap-south-1
  
}

variable AMIS {
    type = map
    default = {
        ap-south-1 = "ami-0c1a7f89451184c8b"
        us-east-1 = "ami-0a9c9f9c2b7e7f967"
    }
}

variable PRIV_KEY_PATH {
    default = "~/.ssh/dovekey"
}

variable PUB_KEY_PATH {
    default = "~/.ssh/dovekey.pub"
}

variable USERNAME {
    default = "ubuntu"
}

variable MYIP {
    default = "49.37.157.47/32"
}

variable rmquser {
    default = "rabbit"
}

variable rmqpass {
    default = "Gr33n@pple123456"
}

variable dbname {
    default = "accounts"
}

variable dbuser {
    default = "admin"
}

variable dbpass {
    default = "admin123"
}

variable instance_count {
    default = 1
}

variable VPC_NAME {
    default = "vprofile-vpc"
}

variable VPC_CIDR {
    default = "172.21.0.0/16"
}

variable Zone1 {
    default = "ap-south-1a"
}

variable Zone2 {
    default = "ap-south-1b"
}

variable Zone3 {
    default = "ap-south-1c"
}

variable PubSub1CIDR {
    default = "172.21.1.0/24"
}

variable PubSub2CIDR {
    default = "172.21.2.0/24"
}

variable PubSub3CIDR {
    default = "172.21.3.0/24"
}

variable PriSub1CIDR {
    default = "172.21.4.0/24"
}

variable PriSub2CIDR {
    default = "172.21.5.0/24"
}

variable PriSub3CIDR {
    default = "172.21.6.0/24"
}