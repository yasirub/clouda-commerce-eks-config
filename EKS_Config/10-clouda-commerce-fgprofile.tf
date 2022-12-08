resource "aws_eks_fargate_profile" "clouda-commerce-api" {
  cluster_name           = aws_eks_cluster.clouda-commerce-cluster.name
  fargate_profile_name   = "clouda-commerce-api"
  pod_execution_role_arn = aws_iam_role.eks-fargate-profile.arn

  # These subnets must have the following resource tag: 
  # kubernetes.io/cluster/<CLUSTER_NAME>.
  subnet_ids = [
    aws_subnet.clouda-commerce-private-us-east-1a.id,
    aws_subnet.clouda-commerce-private-us-east-1b.id
  ]

  selector {
    namespace = "clouda-commerce"
    labels = {
      "app.kubernetes.io/api" = "api"
    }
  }
}

resource "aws_eks_fargate_profile" "clouda-commerce-db" {
  cluster_name           = aws_eks_cluster.clouda-commerce-cluster.name
  fargate_profile_name   = "clouda-commerce-db"
  pod_execution_role_arn = aws_iam_role.eks-fargate-profile.arn

  # These subnets must have the following resource tag: 
  # kubernetes.io/cluster/<CLUSTER_NAME>.
  subnet_ids = [
    aws_subnet.clouda-commerce-private-us-east-1a.id,
    aws_subnet.clouda-commerce-private-us-east-1b.id
  ]

  selector {
    namespace = "clouda-commerce"
    labels = {
      "app.kubernetes.io/db" = "db"
    }
  }
}