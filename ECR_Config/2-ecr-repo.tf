resource "aws_ecr_repository" "saleor-api" {
  name                 = "saleor-api"
  image_tag_mutability = "MUTABLE"
  force_delete = true
  image_scanning_configuration {
    scan_on_push = true
  }
}

resource "docker_registry_image" "saleor-api" {

  name = "${aws_ecr_repository.saleor-api.repository_url}:0.0.1"
  build {
    context = "./../../Clouda-Commerce/saleor/"
    dockerfile = "Dockerfile"
    build_args = {
      test : "test"
    }
    labels = {
      author : "clouda-commerce"
    }
  }
}