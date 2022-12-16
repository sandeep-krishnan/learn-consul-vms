data_dir = "/tmp/consul/client"
encrypt = "p1c6tzMpKFBA5TcHaCzJWMxxU4dTreuxBGhRE/iocA8="

server         = false
advertise_addr = "{{ GetInterfaceIP `eth1` }}"
bind_addr      = "0.0.0.0"
client_addr    = "0.0.0.0"
retry_join     = ["$CONSUL_HTTP_ADDR"]

datacenter = "$DATACENTER_NAME"

ports {
  grpc = 8502
}

telemetry {
  prometheus_retention_time = "24h"
  disable_hostname          = true
}

verify_incoming = false
verify_outgoing = true
verify_server_hostname = true
ca_file = "/mnt/my-machine/certs/ca/consul-agent-ca.pem"
auto_encrypt = {
  tls = true
}