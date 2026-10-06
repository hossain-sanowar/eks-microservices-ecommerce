# 2. Create the EKS cluster (Fargate)

```bash
eksctl create cluster --name demo-cluster --region us-east-1 --fargate
```

`eksctl` creates the VPC, subnets, the EKS control plane and a default Fargate profile
(for `default` and `kube-system`). It takes about 15-20 minutes.

Connect `kubectl` to the cluster:

```bash
aws eks update-kubeconfig --name demo-cluster --region us-east-1
kubectl get pods -A
```

Create a Fargate profile for the application namespace, so its Pods can be scheduled:

```bash
eksctl create fargateprofile \
  --cluster demo-cluster \
  --region us-east-1 \
  --name alb-sample-app \
  --namespace game-2048
```

> Without this profile, Pods in `game-2048` stay in `Pending`, because Fargate only runs
> Pods from namespaces that a profile selects.
