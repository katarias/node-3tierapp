resource "kubernetes_deployment" "webdeployment" {
  metadata {
    name = "webapp-deployment"
    labels = {
      app = "node-webapp"
    }
  }
  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "node-webapp"
      }
    }
    template {
      metadata {
        labels = {
          app = "node-webapp"
        }
      }
      spec {
        container {
          image = "skataria/webapp:latest"
          name  = "webapp"
          env {
		name = "API_HOST"
		value = "http://${kubernetes_service.apiservice.load_balancer_ingress.0.ip}:${var.API_PORT}"
	}
	env {
		name = "PORT"
		value = var.WEB_PORT
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
