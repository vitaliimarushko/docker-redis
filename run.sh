#!/bin/bash

containerName=docker-redis-1
volumeName=redisdata

# create a volume if it doesn't exist
existentVolume=$(docker volume ls -f name=$volumeName --format "{{.Name}}")

if [[ "$existentVolume" != "$volumeName" ]];
  then
    docker volume create "$volumeName"
fi

# kill the old container
docker stop "$containerName"
docker rm "$containerName"

# run a new container
docker run -d \
  --restart unless-stopped \
  --name "$containerName" \
  -v "$volumeName":/data \
  -p 6380:6379 \
  redis:alpine \
  redis-server \
  --save 60 1 \
  --loglevel warning

