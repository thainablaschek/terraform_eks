resource "aws_eks_node_group" "eks_manager_node_group" {
  cluster_name    = var.cluster_name
  node_group_name = "${var.project_name}-manager-node-group"
  node_role_arn   = aws_iam_role.eks_mng_role.arn
  subnet_ids = [
    var.subnet_private_1a,
    var.subnet_private_1b,
  ]

  ami_type       = "AL2023_x86_64_STANDARD"
  instance_types = ["t3.micro"]  # Único aceito pelo seu Free Tier atual
  capacity_type  = "ON_DEMAND"   # O Free Tier padrão não se aplica a instâncias SPOT
  disk_size      = 20            # O Free Tier cobre até 30GB de EBS agregados na conta

  scaling_config {
    desired_size = 1
    max_size     = 2
    min_size     = 1
  }

  update_config {
    max_unavailable = 1
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-manager-node-group"
    }
  )

  depends_on = [
    aws_iam_role_policy_attachment.eks_mng_role_attachment_worker,
    aws_iam_role_policy_attachment.eks_mng_role_attachment_cni,
    aws_iam_role_policy_attachment.eks_mng_role_attachment_ecr,
  ]

  lifecycle {
    ignore_changes = [scaling_config[0].desired_size]
  }
}