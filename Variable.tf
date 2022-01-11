# Region Variable
variable "Region_Variable" {
    type = string
    default = "eu-west-1"
}

# VPC Variable
variable "VPC_CIDR" {
    type = string
    default = "10.0.0.0/16"
}

# Subnet VAriables 
 #PubSN1
 variable "PSN1_Var" {
     type = string
     description = "Public SN1 Variable"
     default = "10.0.0.0/24"
 }
 #PubSN2
 variable "PSN2_Var" {
     type = string
     description = "Public SN2 Variable"
     default = "10.0.1.0/24"
 }
 #PrivSN1
 variable "PRSN1_Var" {
     type = string
     description = "Private SN1 Variable"
     default = "10.0.2.0/24"
 }
 #PrivSN2
 variable "PRSN2_Var" {
     type = string
     description = "Private SN2 Variable"
     default = "10.0.3.0/24"
 }

 #Database Security Group
 variable "DB-SG" {
     type = string
     default = "10.0.4.0/24"
 }

 #AMI
 variable "AMI_Var" {
     type = string
     description = "AMI ID" #Amazon2 Linux AMI
     default = "ami-04632f3cef5083854"
 }