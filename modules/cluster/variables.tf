
variable "project_name" {
  type        = string
  description = "Nome do projeto para tagueamento dos recursos"
}
variable "tags" {
  type        = map(string)
  description = "Tags para os recursos"
  default     = {}
}
variable "subnet_public_1a" {
  type        = string
  description = "IDs das subnets públicas para o EKS Cluster"
}
variable "subnet_public_1b" {
  type        = string
  description = "IDs das subnets públicas para o EKS Cluster"
}