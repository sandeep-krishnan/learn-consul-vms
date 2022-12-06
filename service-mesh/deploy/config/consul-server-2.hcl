data_dir = "/tmp/consul/server"
encrypt = "p1c6tzMpKFBA5TcHaCzJWMxxU4dTreuxBGhRE/iocA8="
server           = true
bootstrap_expect = 1
advertise_addr   = "{{ GetInterfaceIP `eth1` }}"
client_addr      = "0.0.0.0"
bind_addr        = "0.0.0.0"

ports {
  grpc = 8502
}

enable_central_service_config = true

ui_config {
  enabled          = true
  metrics_provider = "prometheus"
  metrics_proxy {
    base_url = "http://$PROMETHEUS_IP_ADDR:9090"
  }
}

connect {
  enabled = true
  enable_mesh_gateway_wan_federation = true
}

datacenter = "dc2"

telemetry {
  prometheus_retention_time = "24h"
  disable_hostname          = true
}

config_entries {
  bootstrap = [
    {
      kind = "proxy-defaults"
      name = "global"
      config {
        protocol                   = "http"
        envoy_prometheus_bind_addr = "0.0.0.0:9102"
      }
    }
  ]
}

#retry_join_wan = ["192.168.56.10"]

verify_incoming = true
verify_outgoing = true
verify_server_hostname = true
ca_file = "/mnt/my-machine/certs/ca/consul-agent-ca.pem"
cert_file = "/mnt/my-machine/certs/ca/dc2-server-consul-0.pem"
key_file = "/mnt/my-machine/certs/ca/dc2-server-consul-0-key.pem"
auto_encrypt {
  allow_tls = true
}
