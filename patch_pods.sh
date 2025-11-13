#!/bin/bash

kubectl -n factoryal-db patch deployments.apps influxdb2-oauth2-proxy \
    -p='{"spec": {"template": {"spec": {"hostAliases":[{"ip": "192.168.213.10", "hostnames": ["keycloak.xlayer.docker"]}]}}}}'

kubectl -n factoryal-ui patch deployments.apps fcp-ui-backend-factoryal-fcp-ui-backend \
    -p='{"spec": {"template": {"spec": {"hostAliases":[{"ip": "192.168.213.10", "hostnames": ["keycloak.xlayer.docker"]}]}}}}'

kubectl -n factoryal-configurator patch deployments.apps configuration-holder-factoryal-configuration-holder \
    -p='{"spec": {"template": {"spec": {"hostAliases":[{"ip": "192.168.213.10", "hostnames": ["keycloak.xlayer.docker"]}]}}}}'

kubectl -n factoryal-ui patch deployments.apps grafana \
    -p='{"spec": {"template": {"spec": {"hostAliases":[{"ip": "192.168.213.10", "hostnames": ["keycloak.xlayer.docker"]}]}}}}'