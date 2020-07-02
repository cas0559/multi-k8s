docker build -t cas0559/multi-client:latest -t cas0559/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t cas0559/multi-server:latest -t cas0559/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t cas0559/multi-worker:latest -t cas0559/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push cas0559/multi-client:latest
docker push cas0559/multi-server:latest
docker push cas0559/multi-worker:latest
docker push cas0559/multi-client:$SHA
docker push cas0559/multi-server:$SHA
docker push cas0559/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployment/multi-client client=cas0559/multi-client:$SHA
kubectl set image deployment/multi-server server=cas0559/multi-server:$SHA
kubectl set image deployment/multi-worker worker=cas0559/multi-worker:$SHA
