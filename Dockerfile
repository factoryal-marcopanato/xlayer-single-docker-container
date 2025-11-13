FROM ubuntu:24.04
RUN apt update && apt install -y ca-certificates curl
COPY k3s-v1.34.1-k3s1 /usr/local/bin/
RUN ln -s /usr/local/bin/k3s-v1.34.1-k3s1 /usr/local/bin/kubectl
COPY nginx-deploy.yaml /var/lib/rancher/k3s/server/manifests/nginx-deploy.yaml
COPY argocd-install.yaml /var/lib/rancher/k3s/server/manifests/argocd-install.yaml

ENTRYPOINT ["/usr/local/bin/k3s-v1.34.1-k3s1"]
CMD ["server", "--alsologtostderr", "--disable", "traefik", "--snapshotter=native"]

# docker network create xlayer-network --subnet 192.168.213.0/24
# docker run -it --network xlayer-network --ip 192.168.213.10 --privileged -p 80:80 -p 443:443 -p 6443:6443 plain-k3s:base
# docker exec -it test-k3s cat /etc/rancher/k3s/k3s.yaml > kubeconfig