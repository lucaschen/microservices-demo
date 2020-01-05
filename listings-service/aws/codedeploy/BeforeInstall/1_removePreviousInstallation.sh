#!/bin/sh

deployment_dir=/opt/microservices-demo/listings-service
if [ -d "$deployment_dir" ] && [ -x "$deployment_dir" ]; then
  cd /opt/microservices-demo/listings-service

  rm -rf *
fi