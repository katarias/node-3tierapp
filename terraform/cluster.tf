resource "digitalocean_kubernetes_cluster" "nodecluster" {
	name = var.cluster_name
        region = var.region
	version = var.cluster_version

  node_pool {
    name       = "worker-pool"
    size       = var.size
    node_count = 1
    auto_scale = true
    min_nodes  = var.cluster_minpool
    max_nodes  = var.cluster_maxpool
  }
}

provider "kubernetes" {
  load_config_file = false
  host  = digitalocean_kubernetes_cluster.nodecluster.endpoint
  token = digitalocean_kubernetes_cluster.nodecluster.kube_config[0].token
  cluster_ca_certificate = base64decode(
    digitalocean_kubernetes_cluster.nodecluster.kube_config[0].cluster_ca_certificate
  )
}
