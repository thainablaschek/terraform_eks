output "cluster_name" {
  value = aws_eks_cluster.eks_cluster.id
}

output "eks_vpc_config" {
  value = module.eks_cluster_role.eks_vpc_config
}