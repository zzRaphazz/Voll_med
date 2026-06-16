#! /bin/bash

docker load -i vollmed-api.tar

mv docker-compose-prod.yaml docker-compose.yaml

container_ids=$(docker ps -q)

if [ -z "$container_ids" ]; then
      echo "Não há containers em execução"
else
    for container_id in $container_ids; do
        echo "Stop de contaneir: $container_id"
        docker stop $container_id
    done
    echo "Container encerrados"
fi

docker compose up -d
