#!/usr/bin/env bash
# Deploys the 12-component Robot Shop with Helm and prints the ALB address.
set -euo pipefail
cd "$(dirname "$0")/.."

kubectl apply -f k8s/storageclass-gp3.yaml
kubectl apply -f k8s/namespace.yaml

helm upgrade --install robot-shop ./helm-robot-shop -n robot-shop --wait --timeout 10m

kubectl get pods -n robot-shop
echo "Waiting for the ALB address..."
until ADDR=$(kubectl get ingress robot-shop -n robot-shop -o jsonpath='{.status.loadBalancer.ingress[0].hostname}') && [ -n "$ADDR" ]; do
  sleep 10
done
echo "Open: http://$ADDR"
