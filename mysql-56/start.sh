#!/bin/sh

docker-compose build --pull db-mysql
docker-compose up -d --no-recreate

#EOF
