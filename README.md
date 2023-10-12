# alpine-tools

> A collection of tools for an Alpine Linux Docker image. Used to be easily deployable to a Kubernetes cluster for debugging purposes. It also comes with a SSH server - configured for use within Azure App Service - to debug a container running in Azure App Service.

## Usage

```bash
kubectl run --image mheers/alpine-tools host-alpine-tools --command sleep infinity
```
