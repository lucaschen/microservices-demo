#!/bin/sh

deployment_dir=/opt/microservices-demo/users-service
if [ -d "$deployment_dir" ] && [ -x "$deployment_dir" ]; then
  cd /opt/microservices-demo/users-service

  # we have to do this because it throws an error if it can't find the process... and then the whole build breaks
  node -e 'try{require("child_process").execSync("pm2 stop users-service")}catch(e){}';
fi
