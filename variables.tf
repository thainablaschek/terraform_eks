variable "cidr_block" {
  type        = string
  description = "CIDR usado na VPC"
}
variable "project_name" {
  type        = string
  description = "Nome do projeto para tagueamento dos recursos"

}

variable "user_arn_cluster_access_entry" {
  type        = string
  description = "ARN do IAM principal que receberá AmazonEKSClusterAdminPolicy. Deixe em branco para não criar access entry adicional."
  default     = ""
}