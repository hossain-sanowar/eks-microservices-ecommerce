#!/usr/bin/env bash
# Creates one hub cluster (runs Argo CD) and two spoke clusters (run the app).
set -euo pipefail
REGION="${REGION:-us-east-1}"

eksctl create cluster --name hub-cluster     --region "$REGION" --node-type t3.medium --nodes 2 &
eksctl create cluster --name spoke-cluster-1 --region "$REGION" --node-type t3.small  --nodes 2 &
eksctl create cluster --name spoke-cluster-2 --region "$REGION" --node-type t3.small  --nodes 2 &
wait   # the three clusters are created in parallel (about 20 min)

kubectl config get-contexts
