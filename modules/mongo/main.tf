
resource "docker_image" "mongo" {
  name         = "mongo"
  keep_locally = true
}

resource "docker_container" "mongo" {
  name  = "mongos"
  image = "${docker_image.mongo.latest}"
  ports{
    internal = 27017
    external = 27017
  }
}
resource "docker_image" "mongo_exporter" {
  name         = "eses/mongodb_exporter"
  keep_locally = true
}

resource "docker_container" "mongo_exporters" {
  name  = "mongo_exporters"
  image = "${docker_image.mongo_exporter.latest}"
  ports{
    internal = 9104
    external = 9104
  }
}

resource "docker_image" "consul" {
  name         = "consul"
  keep_locally = true
}

resource "docker_container" "consul_agent" {
  name  = "c1"
  image = "${docker_image.consul.latest}"
  command = ["agent", "-dev", "-client=0.0.0.0","-bind=0.0.0.0"]
  ports{
    internal = 8500
    external = 8500
  }
}
