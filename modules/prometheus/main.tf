data "local_file" "prometheus-yml" {
    filename = "${path.module}/prometheus.yml"
}

resource "docker_volume" "prometheus_volume" {
  name = "local_file.prometheus-yml"
}

# get the mongo docker image
resource "docker_image" "prometheus" {
  name         = "prom/prometheus"
  keep_locally = true
}

resource "docker_container" "prometheus" {
  name  = "prometheus"
  image = "${docker_image.prometheus.latest}"
  ports{
    internal = 9001
    external = 9001
}
}
