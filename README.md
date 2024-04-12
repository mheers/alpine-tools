# alpine-tools

> A collection of tools for an Alpine Linux Docker image. Used to be easily deployable to a Kubernetes cluster for debugging purposes. It also comes with a SSH server - configured for use within Azure App Service - to debug a container running in Azure App Service.

Also inlcudes most linux-crisis-tools tools mentioned on https://www.brendangregg.com/blog/2024-03-24/linux-crisis-tools.html

## Usage

```bash
kubectl run --image mheers/alpine-tools host-alpine-tools --command sleep infinity
```
