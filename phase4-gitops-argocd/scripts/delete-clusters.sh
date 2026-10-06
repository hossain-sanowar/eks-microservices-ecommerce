#!/usr/bin/env bash
# Deletes all three clusters to stop AWS costs.
set -euo pipefail
REGION="${REGION:-us-east-1}"

for c in spoke-cluster-1 spoke-cluster-2 hub-cluster; do
  eksctl delete cluster --name "$c" --region "$REGION" --wait &
done
wait
