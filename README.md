# Overview

This repository is derived from [HashiCorp Learn](https://github.com/hashicorp/learn-consul-vms)
website.

# How to?
cd service-mesh/deploy/scripts
vagrant up consul-server mesh consul-server-2 mesh2 cart order order2


# Features
1. Consul Federation with [Mesh Gateway](https://developer.hashicorp.com/consul/docs/connect/gateways/mesh-gateway/wan-federation-via-mesh-gateways)
2. Sample services to demo (cart & order)
3. Service failover across datacenter using service resolver.