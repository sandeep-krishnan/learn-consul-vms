#!/usr/bin/env bash
APP_NAME=${1}

set -o errexit

pushd /mnt/my-machine
cp fake.service /etc/systemd/system/fake.service
cp ${APP_NAME}.env /tmp/fake-service.env
popd

VERSION="0.0.4"
DOWNLOAD=https://github.com/nicholasjackson/fake-service/releases/download/v0.24.2/fake_service_linux_amd64.zip

function install_app() {
	curl -sSL --fail -o /tmp/fake-service.zip ${DOWNLOAD}
	unzip /tmp/fake-service.zip -d /tmp
	mv /tmp/fake-service /usr/bin/fake-service
	chmod +x /usr/bin/fake-service
}

install_app

cat << EOF > /tmp/start-fake-service.sh
#!/bin/sh

export $(xargs < /tmp/fake-service.env)
/usr/bin/fake-service
EOF

chmod +x /tmp/start-fake-service.sh

systemctl daemon-reload
systemctl enable fake
systemctl start fake