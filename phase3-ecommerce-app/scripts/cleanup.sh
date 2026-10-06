#!/usr/bin/env bash
# Removes the app first (so the ALB and EBS volumes are deleted), then the whole infrastructure.
set -euo pipefail
cd "$(dirname "$0")/.."

helm uninstall robot-shop -n robot-shop || true
kubectl delete pvc --all -n robot-shop --ignore-not-found
helm uninstall aws-load-balancer-controller -n kube-system || true
sleep 60   # give AWS time to delete the ALB before the VPC is removed

cd terraform
terraform destroy
