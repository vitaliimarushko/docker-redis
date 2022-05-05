# Requirements

Install the following dependencies:
 - [Docker](https://docs.docker.com/engine/install/debian/#install-using-the-repository): ^19.x

# Deployment

1. Add required permission to execute the main script:
```shell
sudo chmod u+x run.sh
```
2. Run the script:
```shell
./run.sh
```
###### Notice
> All databases will be stored in `/var/lib/docker/volumes/redisdata/_data` folder permanently. By default, you will not be able to get access to that folder: you have to add "read" credentials. 

# Connection

Parameter | Value
--- | ---
host | 0.0.0.0
port | 6380

Also, you can get the manual access through the docker instance:
```shell
docker exec -it docker-redis-1 redis-cli
```
