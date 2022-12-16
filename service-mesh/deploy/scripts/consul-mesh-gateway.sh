#!/usr/bin/env bash

CONSUL_HTTP_ADDR=${1}
APP_NAME=${2}
APP_IP_ADDR=${3}
GATEWAY_NAME=${4}
DATACENTER_NAME=${5}

pushd /mnt/my-machine
cp consul.service /etc/systemd/system/consul.service
mkdir -p /etc/consul.d
popd

sed 's/$CONSUL_HTTP_ADDR/'"${CONSUL_HTTP_ADDR}"'/g' /mnt/my-machine/consul-client.hcl > /etc/consul.d/consul.hcl
sed -i 's/$DATACENTER_NAME/'"${DATACENTER_NAME}"'/g'   /etc/consul.d/consul.hcl
sed 's/$GATEWAY_NAME/'"${GATEWAY_NAME}"'/g' /mnt/my-machine/services/mesh.hcl > /etc/consul.d/${APP_NAME}.hcl

cat << EOF > /etc/systemd/system/consul-envoy.service
[Unit]
Description=Consul Envoy
After=syslog.target network.target

[Service]
ExecStart=/usr/bin/consul connect envoy -gateway=mesh -register  -expose-servers -service "${GATEWAY_NAME}"   -address "127.0.0.1:8443" -wan-address "${APP_IP_ADDR}:8443"
ExecStop=/bin/sleep 5
Restart=always

[Install]
WantedBy=multi-user.target
EOF

chmod 644 /etc/systemd/system/consul-envoy.service

systemctl daemon-reload

# Enable and start the daemons
systemctl enable consul
#systemctl enable consul-envoy

systemctl start consul

systemctl start consul-envoy
