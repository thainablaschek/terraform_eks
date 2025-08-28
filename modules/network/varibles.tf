variable "cidr_block" {
  type        = string
  description = "cidr_block eks-vpc"
}
variable "tags" {
  type        = map(string)
  description = "tags"
}