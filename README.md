# Powerport Infrastructure

Azure Kubernetes Service (AKS) infrastructure for the Powerport EV charging platform.

## Quick Reference

| Resource | Value |
|----------|-------|
| **Resource Group** | `powerport-rg` |
| **AKS Cluster** | `powerport-aks` |
| **Container Registry** | `powerportacr.azurecr.io` |
| **External IP** | `134.112.152.235` |
| **Namespace** | `powerport` |

---

## Cluster Management

### Start the Cluster

```bash
# Start AKS cluster
az aks start --resource-group powerport-rg --name powerport-aks

# Reconnect kubectl (may be needed after restart)
az aks get-credentials --resource-group powerport-rg --name powerport-aks

# Verify all pods are running
kubectl get pods -n powerport
```

### Stop the Cluster

```bash
az aks stop --resource-group powerport-rg --name powerport-aks
```

> 💡 **Tip:** Always stop the cluster when not in use to save costs.

---

## Deployment

### Deploy a Single Service

```bash
helm upgrade --install <service-name> ./helm/<service-name> \
  --set image.tag=latest
```

**Example:**
```bash
helm upgrade --install billing-service ./helm/billing-service \
  --set image.tag=latest
```

### Deploy All Services

```bash
for service in user-service station-service billing-service provider-service data-tracking-service reviews-service; do
  helm upgrade --install $service ./helm/$service --set image.tag=latest
done
```

---

## Container Registry

### Login to ACR

```bash
az acr login --name powerportacr
```

### Build & Push All Images

> ⚠️ **Note:** Images must be built for `linux/amd64` platform (required for AKS).

```bash
# Set ACR name
ACR_NAME=powerportacr.azurecr.io

# Build and push all services
docker build --platform linux/amd64 -t $ACR_NAME/user-service:latest ../powerport-user-service
docker push $ACR_NAME/user-service:latest

docker build --platform linux/amd64 -t $ACR_NAME/station-service:latest ../powerport-station-service
docker push $ACR_NAME/station-service:latest

docker build --platform linux/amd64 -t $ACR_NAME/billing-service:latest ../powerport-billing-service/src/BillingService
docker push $ACR_NAME/billing-service:latest

docker build --platform linux/amd64 -t $ACR_NAME/provider-service:latest ../powerport-provider-service
docker push $ACR_NAME/provider-service:latest

docker build --platform linux/amd64 -t $ACR_NAME/data-tracking-service:latest ../powerport-data-tracking-service/src/DataTrackingService
docker push $ACR_NAME/data-tracking-service:latest

docker build --platform linux/amd64 -t $ACR_NAME/reviews-service:latest ../powerport-reviews-service
docker push $ACR_NAME/reviews-service:latest
```

---

## CI/CD

### Pull from GHCR → Push to ACR

```bash
# Pull from GitHub Container Registry
docker pull ghcr.io/YOUR_ORG/powerport-billing-service:latest

# Tag for ACR
docker tag ghcr.io/YOUR_ORG/powerport-billing-service:latest powerportacr.azurecr.io/billing-service:latest

# Push to ACR
docker push powerportacr.azurecr.io/billing-service:latest
```

> 📋 **TODO:** Create automation script for services with changes.

---

## API Endpoints

Base URL: `http://134.112.152.235`

| Service | Base Path | Swagger |
|---------|-----------|---------|
| User Service | `/users/api/...` | `/users/swagger` |
| Billing Service | `/billing/api/...` | `/billing/swagger` |
| Station Service | `/stations/api/...` | `/stations/swagger` |
| Provider Service | `/providers/api/...` | `/providers/swagger` |
| Reviews Service | `/reviews/api/...` | `/reviews/swagger` |
| Data Tracking | `/tracking/api/...` | `/tracking/swagger` |
| Keycloak | `/realms/...`, `/admin/...` | — |

---

## Useful Commands

```bash
# Check pod status
kubectl get pods -n powerport

# View logs for a service
kubectl logs -n powerport -l app=billing-service --tail=100

# Watch ingress controller
kubectl get svc ingress-nginx-controller -n ingress-nginx -w

# Restart a deployment
kubectl rollout restart deployment/<service-name> -n powerport

# Check ingress configuration
kubectl get ingress powerport-ingress -n powerport -o yaml
```

---

## Architecture

```
                    ┌─────────────────────────────────────┐
                    │        NGINX Ingress Controller     │
                    │          134.112.152.235            │
                    └─────────────────┬───────────────────┘
                                      │
        ┌──────────┬──────────┬───────┴───────┬──────────┬──────────┐
        ▼          ▼          ▼               ▼          ▼          ▼
   ┌─────────┐ ┌─────────┐ ┌─────────┐ ┌──────────┐ ┌─────────┐ ┌─────────┐
   │  User   │ │ Billing │ │ Station │ │ Provider │ │ Reviews │ │Tracking │
   │ Service │ │ Service │ │ Service │ │  Service │ │ Service │ │ Service │
   └─────────┘ └─────────┘ └─────────┘ └──────────┘ └─────────┘ └─────────┘
        │          │          │               │          │          │
        └──────────┴──────────┴───────┬───────┴──────────┴──────────┘
                                      │
                    ┌─────────────────┴───────────────────┐
                    │     PostgreSQL / MongoDB / Kafka    │
                    └─────────────────────────────────────┘
```
