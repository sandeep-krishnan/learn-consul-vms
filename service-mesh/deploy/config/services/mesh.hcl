// public-ingress.hcl
Services {
  Name = "gateway-primary"
  Kind = "mesh-gateway"

  Port = 8443
}
