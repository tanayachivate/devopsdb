#!/bin/bash

# download the node modules
# npm install

# remove the container if exists or running 
if [ $(docker container ls -q -a --filter name=mydb_c) != '' ]; then
    docker container stop mydb_c
    docker container rm mydb_c
fi

# remove the image if exists
if [ $(docker image ls -q --filter reference=mydb) != '' ]; then
    docker image rm mydb
fi

# build the image
docker image build -t mydb .

# start the container
docker container run -itd -p 4000:4000 --name mydb_c mydb
