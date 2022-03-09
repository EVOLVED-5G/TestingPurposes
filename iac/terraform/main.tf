resource "kubernetes_pod" "testing" {
  metadata {
    name = "testing"
    namespace = "evolved5g"
    labels = {
      app = "testing"
    }
  }

  spec {
    container {
      image = "dockerhub.hi.inet/evolved-5g/dummy-netapp:latest"
      name  = "dummy-netapp"
    }
  }
}

resource "kubernetes_service" "testing_service" {
  metadata {
    name = "testing"
    namespace = "evolved5g"
  }
  spec {
    selector = {
      app = kubernetes_pod.testing.metadata.0.labels.app
    }
    port {
      port = 8080
      target_port = 8080
    }
  }
}
