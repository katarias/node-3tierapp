resource "kubernetes_deployment" "apideployment" {
  metadata {
    name = "apiapp-deployment"
    labels = {
      app = "node-apiapp"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "node-apiapp"
      }
    }
    template {
      metadata {
        labels = {
          app = "node-apiapp"
        }
      }
      spec {
        container {
          image = "skataria/apiapp:latest"
          name  = "apiapp"
          env {
		name = "DB"
		value = digitalocean_database_cluster.node-postgres.uri
	}
	env {
		name = "PORT"
		value = var.API_PORT
	}
          resources {
            limits {
              cpu    = "0.8"
              memory = "700Mi"
            }
            requests {
              cpu    = "128m"
              memory = "50Mi"
            }
          }
        }
      }
    }
  }
}
