# WiseCow Deployment

This repository contains the Kubernetes configuration files needed to deploy the WiseCow application, a web app that uses HTTPS on port 443.

## Prerequisites

Ensure you have the following installed:

- [Docker](https://www.docker.com/get-started)
- [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/)
- [Minikube](https://minikube.sigs.k8s.io/docs/start/) or access to a Kubernetes cluster

## Setup Instructions

### 1. Clone the Repository

git clone https://github.com/yourusername/wisecow-deployment.git
cd wisecow-deployment

### 2. Start Kubernetes Cluster

If needed, start a local cluster with Minikube:


minikube start

### 3. Deploy Application

Apply the Kubernetes configuration files:



kubectl apply -f deployment.yaml
kubectl apply -f service.yaml

### 4. (Optional) Configure Ingress

To expose the app via Ingress, apply the Ingress configuration:



kubectl apply -f ingress.yaml

Ensure an Ingress controller is installed in your cluster.
### 5. Verify Deployment

Check if the pods are running:



kubectl get pods

You should see a pod with a name starting with wisecow-deployment in the Running state.
### 6. Access the Application

For Minikube users:



minikube service wisecow-service

For production clusters, use the configured Ingress host or LoadBalancer IP.
Files in This Repository

    deployment.yaml: Deployment configuration.
    service.yaml: Service configuration.
    ingress.yaml: Ingress configuration.

### TLS Configuration

To enable HTTPS, create a TLS secret:



kubectl create secret tls wisecow-tls-secret --cert=path/to/tls.crt --key=path/to/tls.key

Update ingress.yaml to reference this secret.
