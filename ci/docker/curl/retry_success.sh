#!/bin/sh

max_retries=5000

for attempt in $(seq 1 "$max_retries"); do
  if http_status=$(curl -w "%{http_code}" -X POST -H "Content-Type: application/json" --data "@/debezium-mysql-connector-conf.json" -o /dev/null http://debezium-connect:8083/connectors); then
    echo "HTTP Status Code: $http_status"
    if [ "$http_status" -eq 201 ]; then
      exit 0
    fi
    sleep 5
  fi
done


