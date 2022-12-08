data "aws_region" "current" {}
resource "null_resource" "kubectl-update" {
  depends_on = [aws_eks_cluster.clouda-commerce-cluster]

  triggers = {
    endpoint = aws_eks_cluster.clouda-commerce-cluster.endpoint
    cluster = aws_eks_cluster.clouda-commerce-cluster.id
  }

  provisioner "local-exec" {
    command = <<EOH
aws eks update-kubeconfig --name ${aws_eks_cluster.clouda-commerce-cluster.name} --region ${data.aws_region.current.name}
EOH
  }

  lifecycle {
    ignore_changes = [triggers]
  }
}
