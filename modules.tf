module "eks_network" {
  source     = "./modules/network"
  cidr_block = var.cidr_block
  tags       = local.tags

}

module "eks_cluster_role" {
  source           = "./modules/cluster"
  project_name     = var.project_name
  tags             = local.tags
  public_subnet_1a = module.eks_network.subnet_pub_1a
  public_subnet_1b = module.eks_network.subnet_pub_1b
  # oidc_url         = module.eks_cluster.cluster_oidc_issuer_url

}

module "managed-node-group" {
  source            = "./modules/managed-node-group"
  project_name      = var.project_name
  cluster_name      = module.eks_cluster_role.cluster_name
  subnet_private_1a = module.eks_network.subnet_priv_1a
  subnet_private_1b = module.eks_network.subnet_priv_1b
  tags              = local.tags
}

