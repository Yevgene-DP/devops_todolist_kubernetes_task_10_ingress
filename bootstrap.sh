#!/bin/bash

# Створення простору імен
kubectl create namespace todoapp || true

# Розгортання застосунку
kubectl apply -f infrastructure/deployment.yml
kubectl apply -f infrastructure/service.yml

# Встановлення ingress-nginx контролера (для kind)
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.10.0/deploy/static/provider/kind/deploy.yaml

# Очікування, поки ingress-контролер буде готовий
echo "Очікуємо готовності ingress-контролера..."
kubectl wait --namespace ingress-nginx \
  --for=condition=Ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=180s

# Додавання ingress ресурсу
kubectl apply -f infrastructure/ingress/ingress.yml

# Port-forward до ingress-nginx контролера
echo "Портфорвардинг до ingress-nginx (localhost:80)..."
kubectl port-forward --namespace ingress-nginx svc/ingress-nginx-controller 80:80
