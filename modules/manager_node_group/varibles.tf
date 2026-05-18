
variable "project_name" {
  type        = string
  description = "Nome do projeto para tagueamento dos recursos"
}
variable "tags" {
  type        = map(string)
  description = "Tags para os recursos"
  default     = {}
}
variable "cluster_name" {
  type = string
  description = "Nome do EKS cluster mng"
}
variable "subnet_private_1a" {
  type        = string
  description = "ID da Subnet privada 1a para o Node Group do EKS"
}
variable "subnet_private_1b" {
  type        = string
  description = "ID da Subnet privada 1b para o Node Group do EKS"
}