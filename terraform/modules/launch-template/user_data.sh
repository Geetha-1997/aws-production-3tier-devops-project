#!/bin/bash

set -e

dnf update -y

dnf install docker -y

systemctl enable docker

systemctl start docker

usermod -aG docker ec2-user

mkdir -p /opt/app

echo "Production Server Ready" > /opt/app/status.txt

echo "Launch Template Provisioning Completed"