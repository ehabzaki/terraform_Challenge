provider "docker" {
    host = "unix:///var/run/docker.sock"

}


module "prometheus" {
    source = "./modules/prometheus"
   
}

module "mongo" {
    source = "./modules/mongo"
    
}

