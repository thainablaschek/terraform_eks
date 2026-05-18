module "eks_network" {
  source = "./modules/network"

  cidr_block   = var.cidr_block
  project_name = var.project_name
  tags         = local.tags
}
module "eks_cluster" {
  source                        = "./modules/cluster"
  project_name                  = var.project_name
  tags                          = local.tags
  subnet_public_1a              = module.eks_network.subnet_pub_1a
  subnet_public_1b              = module.eks_network.subnet_pub_1b
  user_arn_cluster_access_entry = var.user_arn_cluster_access_entry
}
module "eks_manager_node_group" {
  source            = "./modules/manager_node_group"
  project_name      = var.project_name
  cluster_name      = module.eks_cluster.cluster_name
  subnet_private_1a = module.eks_network.subnet_priv_1a
  subnet_private_1b = module.eks_network.subnet_priv_1b
  tags              = local.tags

  depends_on = [
    module.eks_network,
    module.eks_cluster,
  ]
}
module "eks_controller_policy"{
  source       = "./modules/alb"
  project_name = var.project_name
  tags         = local.tags
}