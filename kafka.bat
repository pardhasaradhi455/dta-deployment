kubectl create -f dta-zookeeper-service.yaml
timeout 10
kubectl create -f dta-zookeeper-pod.yaml
timeout 420
kubectl create -f dta-kafka-service.yaml
timeout 10
kubectl create -f dta-kafka-pod.yaml
timeout 420
kubectl exec --stdin --tty dta-kafka-pod -- /bin/bash -c "opt/kafka/bin/kafka-topics.sh --create --topic orders --partitions 5 --bootstrap-server dta-kafka-service:9093"
timeout 10
kubectl create -f dta-consumer1db-service.yaml
timeout 10
kubectl create -f dta-consumer1db-deployment.yaml
timeout 420
kubectl create -f dta-consumer1-service.yaml
timeout 10
kubectl create -f dta-consumer1-deployment.yaml
timeout 420
kubectl create -f dta-producer-service.yaml
timeout 10
kubectl create -f dta-producer-deployment.yaml
timeout 420