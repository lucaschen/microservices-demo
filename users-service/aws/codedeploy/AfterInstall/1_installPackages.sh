#!/bin/sh
cd /opt/microservices-demo/users-service
mv .production.env .env
yarn
