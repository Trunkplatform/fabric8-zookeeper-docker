ZooKeeper Docker Image for DockerCloud
================================

A ZooKeeper Docker Image for use with DockerCloud.

The image supports the following ZooKeeper modes:

* Standalone
* Clustered

# Standalone Mode
To start the image in standalone mode you can simply use:

    docker run quay.io/trunk/zookeeper

# Clustered Mode
To start the image in clustered mode you need to specify a couple of environment variables for the container.

| Environment Variable                          | Description                           |
| --------------------------------------------- | --------------------------------------|
| MAX_SERVERS                                   | The number of servers in the ensemble |


Each container started with both of the above variables will use the following env variable setup:

    server.1=<container-name-1>:2888:3888
    server.2=<container-name-2>:2888:3888
    server.3=<container-name-3>:2888:3888
    ...
    server.N=<container-name-N>:2888:3888

where container-name-X would normally be DOCKERCLOUD_SERVICE_HOSTNAME-<index> with the exception of when that container is the container actually runnig the service, so for 3 containers this is how the generated configuration of the second container will look like:
    server.1=zookeeper-1:2888:3888
    server.2=0.0.0.0:2888:3888
    server.3=zookeeper-3:2888:3888


