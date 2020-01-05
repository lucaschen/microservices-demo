#!/bin/sh

deployment_dir=/opt/microservices-demo/api-gateway
if [ -d "$deployment_dir" ] && [ -x "$deployment_dir" ]; then
  cd /opt/microservices-demo/api-gateway

  rm -rf *
fi