provider "aws" {
    region =  "us-east-2"
}

variable "cidr_blocks" {
    description = "cidr blocks for vpc and subnet"  
    type = list(string)
}

resource "aws_vpc" "development_vpc" {
    cidr_block = var.cidr_blocks[0]
    tags = {
        Name: "development"
    } 
}

resource "aws_subnet" "dev-subnet-1" {
    vpc_id = aws_vpc.development_vpc.id
    cidr_block = var.cidr_blocks[1]
    availability_zone = "us-east-2a"  
    tags = {
        Name: "subnet-1-dev"
    } 
}

output "dev-vpc-id" {
    value = aws_vpc.development_vpc.id 
}

output "dev-subnet-id" {
    value = aws_subnet.dev-subnet-1.id  
}
