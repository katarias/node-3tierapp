resource "digitalocean_database_user" "user" {
  cluster_id = digitalocean_database_cluster.node-postgres.id
  name       = "apiuser"
}

resource "digitalocean_database_db" "database" {
  cluster_id = digitalocean_database_cluster.node-postgres.id
  name       = "apidb"
}

resource "digitalocean_database_cluster" "node-postgres" {
  name       = "postgres-cluster"
  engine     = "pg"
  version    = "11"
  size       = var.pgsize
  region     = var.region
  node_count = var.pgcount
}
