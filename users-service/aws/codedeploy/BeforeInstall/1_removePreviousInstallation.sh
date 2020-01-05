#!/bin/sh

deployment_dir=/opt/microservices-demo/users-service
if [ -d "$deployment_dir" ] && [ -x "$deployment_dir" ]; then
  cd /opt/microservices-demo/users-service

  rm -rf *
fi