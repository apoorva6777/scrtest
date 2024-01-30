kubectl get service
kubectl apply -f nginx.yaml
sleep 10
kubectl apply -f namespace.yaml
sleep 10
kubectl create secret docker-registry ocirsecret --docker-server=iad.ocir.io  --docker-username='idmaqhrbiuyo/apoorva.alshi@impetus.com' --docker-password='3(OQmu[P0g}2::CtP#Z9'  --docker-email='apoorva.alshi@impetus.com' -n app2
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout tls.key -out tls.crt -subj "/CN=nginxsvc/O=nginxsvc"
kubectl create secret tls tls-secret --key tls.key --cert tls.crt -n app2
kubectl apply -f deployment.yaml
sleep 50
kubectl apply -f service.yaml
sleep 10
kubectl apply -f ingress.yaml
sleep 10
kubectl apply -f metric.yaml
sleep 30
kubectl -n kube-system get deployment/metrics-server 
kubectl apply -f hpa.yaml
sleep 60
kubectl get hpa -n app2
kubectl get service --all-namespaces 