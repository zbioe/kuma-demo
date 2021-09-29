#!/bin/sh
kumactl config control-planes switch --name=cluster-2
kumactl generate zone-ingress-token --zone=cluster-2 > /tmp/cluster2-ingress-token
kuma-dp run --proxy-type=ingress --dns-enabled=false --dataplane-file=ingress.yaml --cp-address=https://localhost:25678 --dataplane-token-file=/tmp/cluster2-ingress-token --log-level=debug
