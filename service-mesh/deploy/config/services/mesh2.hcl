// public-ingress.hcl
Services {
  Name = "public-mesh"
  Kind = "mesh-gateway"

  Port = 8443
}
