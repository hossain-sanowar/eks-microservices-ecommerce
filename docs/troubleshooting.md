# Troubleshooting

| Symptom | Likely cause | Check / fix |
|---|---|---|
| Pods stay `Pending` | No Fargate profile for the namespace | `eksctl get fargateprofile --cluster demo-cluster` |
| Ingress has no ADDRESS | Controller not running or missing IAM permissions | `kubectl logs -n kube-system deploy/aws-load-balancer-controller` |
| Controller logs show `AccessDenied` | IRSA role or OIDC provider missing | Re-check [step 3](03-oidc-provider.md) and the service account annotation |
| Controller cannot find the VPC | `vpcId` / `region` not set on Fargate | Reinstall the Helm chart with both values |
| ALB returns 503 | Target group has no healthy targets | `kubectl describe ingress -n game-2048`, check Pod readiness |
