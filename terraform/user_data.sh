#!/bin/bash
set -euxo pipefail

dnf update -y
dnf install -y nodejs npm tar gzip

npm install -g pm2

mkdir -p "${deploy_path}/releases" "${deploy_path}/current"
chown -R ec2-user:ec2-user "${deploy_path}"

cat >/etc/profile.d/ai4devs-backend.sh <<'EOF'
export PORT=${backend_port}
EOF
