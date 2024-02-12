variable "project" {
  type=string
  default = "coral-current-408814"
  
}
variable "region-tf" {
  type = string
  default = "master-sector-414010"
  
}
variable "zone" {
  type = string
default = "us-central1-c"
}
variable "region" {
  type = string
 default  = "us-central1"
}
variable "tf-instance-abc" {
  type = string
  default = "my-instance"
  
  
}
variable "machine_type" {

   default = "e2-medium"
  
}

variable "image" {
  type = string

default  = "ubuntu-2304-lunar-amd64-v20240109"
}



variable "custom-subnet-tf" {
  type = string
  default  = "test-subnet"
  
}
variable "ip_cidr_range" {
  default = "10.0.0.0/24"
  
}
 
 

variable "sa_terra_account_id" {
  
  default ="sa-manikanta"
  
}
variable "sa_terra_display_name" {
  default = "service-tf"
  
}


variable "custom-vpc-tf" {
  type = string
  default = "my-network"
  
}
variable "gcs-bucket-cs" {
  type = string
  default = "master-sector-414010-bucket"
  
}

variable "location" {
  type = string
  default = "US"
  
}
variable "primary-cluster-tf" {
  type = string
  default = "my-gke-cluster"
  
}
variable "primary_preemptible_nodes" {
  type = string
  default = "my-node-pool"
  
}
variable "node_count" {
  type = number
  default = 2
  
}
variable "node_config" {
  type = bool
  default = true
  
}