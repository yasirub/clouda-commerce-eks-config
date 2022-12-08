resource "docker_image" "saleor" {
  name = "saleor"
  build {
    path       = "./../../Clouda-Commerce/saleor/"
    dockerfile = "Dockerfile"
    tag        = ["saleor:develop"]
    build_arg = {
      foo : "zoo"
    }
    label = {
      author : "zoo"
    }
  }
}