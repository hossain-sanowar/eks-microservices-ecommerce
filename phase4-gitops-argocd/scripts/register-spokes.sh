#!/usr/bin/env bash
# Registers both spoke clusters in Argo CD and labels them env=spoke,
# so the ApplicationSet deploys to them automatically.
# Run after: argocd login localhost:8080 --username admin --insecure
set -euo pipefail

for ctx in $(kubectl config get-contexts -o name | grep spoke-cluster); do
  argocd cluster add "$ctx" --label env=spoke --yes
done
argocd cluster list
