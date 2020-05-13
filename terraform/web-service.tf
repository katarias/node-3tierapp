resource "kubernetes_service" "webservice" {
  metadata {
    name = "webapp-service"
  }
  spec {
    selector = {
      app = "node-webapp"
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "LoadBalancer"
  }
}

output "web_ip" {
  value = kubernetes_service.webservice.load_balancer_ingress.0.ip
}
