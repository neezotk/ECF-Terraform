
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = var.cluster_name
  cluster_version = var.cluster_version
  cluster_endpoint_public_access  = true

  cluster_addons = {
    coredns = {
      most_recent = true
    }
    kube-proxy = {
      most_recent = true
    }
    vpc-cni = {
      most_recent = true
    }
  }

  vpc_id                   = module.vpc.vpc_id
  
  control_plane_subnet_ids = module.vpc.public_subnets

  subnet_ids               = module.vpc.private_subnets
  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    instance_types = ["t3.large"]
    attach_cluster_primary_security_group = true
  }
      
  eks_managed_node_groups = {
    "${var.cluster_name}-ng" = {
      min_size     = 1
      max_size     = 10
      desired_size = var.desired_size

      instance_types = [var.instances_type]
    }
  }

  # Cluster access entry
  # To add the current caller identity as an administrator
  enable_cluster_creator_admin_permissions = true
  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}