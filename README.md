# Overview

This repository is derived from [HashiCorp Learn](https://github.com/hashicorp/learn-consul-vms)
website.


## Features
1. Latest versions of Consul & Envoy
2. Consul Federation with [Mesh Gateway](https://developer.hashicorp.com/consul/docs/connect/gateways/mesh-gateway/wan-federation-via-mesh-gateways)
3. Sample services to demo (cart & order)
4. Service failover across datacenter using service resolver.  

## How to?
### Bootstrap  
cd service-mesh/deploy/scripts   
vagrant up consul-server mesh consul-server-2 mesh2 cart order order2   

### Testing
#### WAN Federation
TODO  

#### Services
TODO  

#### Datacenter failover
TODO  