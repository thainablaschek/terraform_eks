resource "aws_eks_access_entry" "user_admin" {
  count         = var.user_arn_cluster_access_entry == "" ? 0 : 1
  cluster_name  = aws_eks_cluster.eks_cluster.name
  principal_arn = var.user_arn_cluster_access_entry
  type          = "STANDARD"

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-access-entry"
    }
  )
}

resource "aws_eks_access_policy_association" "user_admin" {
  count         = var.user_arn_cluster_access_entry == "" ? 0 : 1
  cluster_name  = aws_eks_cluster.eks_cluster.name
  principal_arn = var.user_arn_cluster_access_entry
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"

  access_scope {
    type = "cluster"
  }

  depends_on = [aws_eks_access_entry.user_admin]
}
