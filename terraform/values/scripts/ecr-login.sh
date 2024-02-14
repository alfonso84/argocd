#!/bin/sh
# used to pull image from private ECR by argocd-image-updater
TOKEN=$(aws ecr get-login-password --region us-east-1)
kubectl create secret generic aws-ecr-creds \
    --from-literal=creds=AWS:$TOKEN \
    --dry-run=client \
    --namespace argocd \
    --output yaml \
    | kubectl apply --filename -