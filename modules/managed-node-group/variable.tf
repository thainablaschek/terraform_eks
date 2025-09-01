variable "project_name" {
  type        = string
  description = "name project"
}
variable "tags" {
  type        = map(string)
  description = "tags"
}
variable "cluster_name" {
  type        = string
  description = "name eks mng"
}

variable "subnet_private_1a" {
  type        = string
  description = "subnet id 1a"
}
variable "subnet_private_1b" {
  type        = string
  description = "subnet id 1b"
}