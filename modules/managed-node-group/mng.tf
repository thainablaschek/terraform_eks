resource "aws_eks_node_group" "eks_node_group" {
  cluster_name    = va.cluster_name
  node_group_name = "${var.project_name}-node-gooup"
  node_role_arn   = aws_iam_role.eks_mng_role.arn
  subnet_ids = [
    var.subnet_private_1a,
    var.subnet_private_1b
  ]

  scaling_config {
    desired_size = 1
    max_size     = 1
    min_size     = 1
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks-role-mng-attachment_worker,
    aws_iam_role_policy_attachment.eks-role-mng-attachment_ecr,
    aws_iam_role_policy_attachment.eks-role-mng-attachment_cni,
  ]

  tags = merge(
    var.tags,
    {
      Name = "eks--mng-node-group"
    }
  )

}