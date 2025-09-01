variable "tags" {
  type        = map(string)
  description = "tags"
}
variable "project_name" {
  type        = string
  description = "name project"
}
variable "public_subnet_1a" {
  type        = string
  description = "subnets to create EKS cluster AZ 1a"
}
variable "public_subnet_1b" {
  type        = string
  description = "subnets to create EKS cluster AZ 1b"
}
output "eks_vpc_config" {
  value = aws_eks_cluster.eks.vpc_config
}