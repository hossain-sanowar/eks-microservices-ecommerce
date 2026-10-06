# 1. Prerequisites

| Tool | Purpose | Install guide |
|---|---|---|
| AWS CLI | Talk to AWS, configure credentials | https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html |
| kubectl | Work with the Kubernetes cluster | https://docs.aws.amazon.com/eks/latest/userguide/install-kubectl.html |
| eksctl | Create and manage EKS clusters | https://eksctl.io/installation/ |
| Helm | Install the AWS Load Balancer Controller | https://helm.sh/docs/intro/install/ |

Configure AWS credentials for an IAM user (not the root account) and check the setup:

```bash
aws configure
aws sts get-caller-identity
kubectl version --client
eksctl version
helm version
```
