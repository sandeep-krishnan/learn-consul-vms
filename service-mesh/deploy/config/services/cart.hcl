services {
  id   = "cart"
  name = "cart"
  tags = [
    "hashicups"
  ]
  address = "$IP_ADDR"
  port    = 9090
  checks = [
    {
      id       = "http"
      name     = "HTTP on port 9090"
      tcp      = "$IP_ADDR:9090"
      interval = "30s"
      timeout  = "60s"
    }
  ]
  connect {
    sidecar_service {
      port = 20000
      check {
        name     = "Connect Envoy Sidecar"
        tcp      = "$IP_ADDR:20000"
        interval = "10s"
      }
      proxy {
        upstreams {
          destination_name   = "order"
          local_bind_address = "127.0.0.1"
          local_bind_port    = 10000
          config {
            protocol = "http"
          }
        }
        config {
          protocol                   = "http"
          envoy_prometheus_bind_addr = "0.0.0.0:9102"
        }
      }
    }
  }
}
