#!/usr/bin/env bash
# Deletes all Phase 1 resources to avoid ongoing AWS costs.
set -euo pipefail
CLUSTER=demo-cluster
REGION=us-east-1

echo "Deleting the 2048 app (this also removes the ALB)..."
kubectl delete -f https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/examples/2048/2048_full.yaml --ignore-not-found
sleep 60   # give the controller time to delete the ALB

echo "Uninstalling the AWS Load Balancer Controller..."
helm uninstall aws-load-balancer-controller -n kube-system || true

echo "Deleting the EKS cluster (about 10-15 min)..."
eksctl delete cluster --name "$CLUSTER" --region "$REGION"

echo "Optional: delete the IAM policy AWSLoadBalancerControllerIAMPolicy in the IAM console."
