# 5. Deploy the 2048 app with an Ingress

```bash
kubectl apply -f https://raw.githubusercontent.com/kubernetes-sigs/aws-load-balancer-controller/v2.5.4/docs/examples/2048/2048_full.yaml
```

The manifest creates:

| Object | Purpose |
|---|---|
| Namespace `game-2048` | Matches the Fargate profile |
| Deployment `deployment-2048` | Runs the app Pods |
| Service `service-2048` | Exposes the Pods inside the cluster |
| Ingress `ingress-2048` | `ingressClassName: alb`, so the controller creates an internet-facing ALB |

## Check the result

```bash
kubectl get pods -n game-2048
kubectl get svc -n game-2048
kubectl get ingress -n game-2048     # ADDRESS shows the ALB DNS name
```

It takes 2-3 minutes until the ALB is active. Then open the ADDRESS in the browser.
