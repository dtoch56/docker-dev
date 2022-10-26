# docker-dev
Common services for all applications.

## Installation

Pre-requisites:

- [https://docs.docker.com/engine/install/](Docker)
- [https://docs.docker.com/compose/install/](docker-compose)

Copy and configure environment variables in the following file:

```bash
cp .env.dist .env
```

To access private docker registry run (use your GitLab credentials to authorise):

```bash
docker login registry.private.my
```

## Network
For local development and on a staging (test) environment, all containers are on the same network - `dev`.

**Network name:** dev

**Subnet:** 172.20.0.0/16

## HTTPS TLS certificates

To generate certs for localhost run:

```bash
make cert
```

## Services

### Percona MySQL Server 8 - database system
Percona Server is a fork of the MySQL relational database management system created by Percona.

[Percona Server in DockerHub](https://hub.docker.com/_/percona)

[Documentation](https://www.percona.com/doc/percona-server/LATEST/index.html)

    DNS: database.dev.docker

### PostgreSQL 13 - database system
The PostgreSQL object-relational database system provides reliability and data integrity.

[PostgreSQL in DockerHub](https://hub.docker.com/_/postgres)

[Documentation](https://www.postgresql.org/docs/current/)

    DNS: postgres.dev.docker

### etcd - key-value store
A distributed, reliable key-value store for the most critical data of a distributed system

[Documentation](https://etcd.io/docs/current/)

    DNS: etcd.dev.docker

### RabbitMQ 3 - messaging broker
RabbitMQ is an open source multi-protocol messaging broker.

[RabbitMQ in DockerHub](https://hub.docker.com/_/rabbitmq)

[Documentation](https://www.rabbitmq.com/documentation.html)

    DNS: rabbitmq.dev.docker

Web interface is reachable on: http://localhost:15672

### NATS 2 - messaging system
NATS is an open-source, high-performance, cloud native messaging system.

[nats in DockerHub](https://hub.docker.com/_/nats)

[Documentation](https://docs.nats.io/)

    DNS: nats.dev.docker

## Other useful tools

### phpmyadmin - A web interface for MySQL.
phpMyAdmin is a free software tool written in PHP, intended to handle the administration of MySQL over the Web. phpMyAdmin supports a wide range of operations on MySQL and MariaDB. Frequently used operations (managing databases, tables, columns, relations, indexes, users, permissions, etc) can be performed via the user interface, while you still have the ability to directly execute any SQL statement.

[phpmyadmin in DockerHub](https://hub.docker.com/_/phpmyadmin)

[Documentation](https://www.phpmyadmin.net/)

Web interface is reachable on: http://localhost:8001

### portainer - Making Docker and Kubernetes Management Easy...
Portainer is a lightweight management UI which allows you to easily manage your Docker AND Kubernetes clusters.
Portainer is meant to be as simple to deploy as it is to use. It consists of a single container that can run on any Cluster.

[portainer in DockerHub](https://hub.docker.com/r/portainer/portainer-ce)

[Documentation](https://documentation.portainer.io/)

Web interface is reachable on: http://localhost:9000

## Storage

```bash
mkdir -p /storage/docker-dev/{mysql,postgres,rabbitmq,etcd,portainer}
```

The suggested path for local development:

```bash
mkdir -p ~/projects/dev/storage/docker-dev/{mysql,postgres,rabbitmq,etcd,portainer}
mkdir -p ~/projects/dev/storage/docker-dev/mysql/{data,db}
mkdir -p ~/projects/dev/storage/docker-dev/postgres/{data,db}
mkdir -p ~/projects/dev/storage/docker-dev/etcd/data
mkdir -p ~/projects/dev/storage/docker-dev/portainer/data
```


## Docker swarm
```bash
sudo ln -s ~/projects/dev/storage/ /storage
```

To run in Docker Swarm mode (`docker-stack.yml`):
```bash
docker stack deploy --with-registry-auth -c docker-stack.yml dev
docker stack services dev
docker stack ps dev
```
