#!/usr/bin/env bash
# Installs the AWS Load Balancer Controller with the IRSA role created by Terraform.
set -euo pipefail
cd "$(dirname "$0")/../terraform"

CLUSTER=$(terraform output -raw cluster_name)
REGION=$(terraform output -raw region)
VPC_ID=$(terraform output -raw vpc_id)
ROLE_ARN=$(terraform output -raw lb_controller_role_arn)

helm repo add eks https://aws.github.io/eks-charts
helm repo update eks

helm upgrade --install aws-load-balancer-controller eks/aws-load-balancer-controller \
  -n kube-system \
  --set clusterName="$CLUSTER" \
  --set region="$REGION" \
  --set vpcId="$VPC_ID" \
  --set serviceAccount.create=true \
  --set serviceAccount.name=aws-load-balancer-controller \
  --set serviceAccount.annotations."eks\.amazonaws\.com/role-arn"="$ROLE_ARN"

kubectl rollout status deployment/aws-load-balancer-controller -n kube-system
