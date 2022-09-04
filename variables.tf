variable "region-name"{
    description = "making region a variale"
    default = "eu-west-2"
    type = string
}


variable "cidr-for-vpc"{
    description = "the cidr for vpc"
    default = "10.0.0.0/16"
    type = string
}


variable "cidr-for-Private-sub1"{
    description = "private sub1 cidr"
    default = "10.0.1.0/24"
    type = string
}


variable "cidr-for-Private-sub2"{
    description = "private sub2 cidr"
    default = "10.0.2.0/24"
    type = string
}


variable "cidr-for-Public-sub1"{
    description = "public sub1 cidr"
    default = "10.0.3.0/24"
    type = string
}


variable "cidr-for-Public-sub2"{
    description = "public sub2 cidr"
    default = "10.0.4.0/24"
    type = string
}


variable "AZ-1"{
    description = "availability zone"
    default = "eu-west-2a"
    type = string
}