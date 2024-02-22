# power-eda-stack
A set of tools and infra that eases the process to enable Event Driven Architecture in your project. 



1. ### Docker

- In directory ci/docker/

```shell
docker compose up -d
```
- Switching off the docker-compose deleting all volume:

in directory ci/docker/

```shell
docker compose down -v
```



- Stop all containers without point to docker-compose.yaml and without remove volumes :

````shell
docker stop $(docker ps -aq)
````

2. ### Execute this bash script to dowload debezium mysql connector:

Windows machines:

```shell
cd ci/dev/kafka/connect/connectors/ ; bash get-confluent-plugins.sh
```

Linux machines:

```shell
cd ci/dev/kafka/connect/connectors/  && bash get-confluent-plugins.sh
```


## Observability links

1. AKHQ: http://localhost:8089
2. GRAPHANA: http://localhost:3000 (user:admin password:barcelona)
3. PROMETHEUS: http://localhost:9090
3. KEYCLOAK: http://localhost:8443
4. Container statistics docker CPU, RAM, ... stats with:
```shell
docker stats $(docker-compose ps -q)
```