// public-ingress.hcl
Services {
  Name = "gateway-secondary"
  Kind = "mesh-gateway"

  Port = 8443
}
