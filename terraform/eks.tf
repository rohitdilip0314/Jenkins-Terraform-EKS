module "eks" {
  source = "terraform-aws-modules/eks/aws"

  cluster_name = local.name

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    default = {
      desired_size = 1
      max_size     = 2
      min_size     = 1

      instance_types = ["t3.micro"]
    }
  }
}
