#!/bin/bash
docker run -d --name grafana -p 3000:3000 \
  -e GF_AUTH_GENERIC_OAUTH_ENABLED=true \
  -e GF_AUTH_GENERIC_OAUTH_NAME="Keycloak" \
  -e GF_AUTH_GENERIC_OAUTH_CLIENT_ID="grafana" \
  -e GF_AUTH_GENERIC_OAUTH_CLIENT_SECRET="YOUR_CLIENT_SECRET_HERE" \
  -e GF_AUTH_GENERIC_OAUTH_SCOPES="openid profile email" \
  -e GF_AUTH_GENERIC_OAUTH_AUTH_URL="http://localhost:8080/realms/homelab/protocol/openid-connect/auth" \
  -e GF_AUTH_GENERIC_OAUTH_TOKEN_URL="http://172.17.0.1:8080/realms/homelab/protocol/openid-connect/token" \
  -e GF_AUTH_GENERIC_OAUTH_API_URL="http://172.17.0.1:8080/realms/homelab/protocol/openid-connect/userinfo" \
  grafana/grafana:latest

