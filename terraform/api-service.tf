resource "kubernetes_service" "apiservice" {
  metadata {
    name = "apiapp-service"
  }
  spec {
    selector = {
      app = "node-apiapp"
    }
    port {
      port        = 8080
      target_port = 8080
    }
    type = "LoadBalancer"
  }
}

output "api_ip" {
  value = kubernetes_service.apiservice.load_balancer_ingress.0.ip
}
