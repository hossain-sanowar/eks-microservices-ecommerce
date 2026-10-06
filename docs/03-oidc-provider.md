# 3. Configure the IAM OIDC provider

The OIDC provider lets Kubernetes service accounts assume IAM roles (**IRSA**).
The AWS Load Balancer Controller needs this to create load balancers.

```bash
export cluster_name=demo-cluster

oidc_id=$(aws eks describe-cluster --name $cluster_name \
  --query "cluster.identity.oidc.issuer" --output text | cut -d '/' -f 5)

# Check whether a provider already exists
aws iam list-open-id-connect-providers | grep $oidc_id | cut -d "/" -f4

# If the command above returns nothing, create it
eksctl utils associate-iam-oidc-provider --cluster $cluster_name --approve
```
