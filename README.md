# Dockerizing-NodeApp-ELK

Test with a new Docker Compose file as well called docker-compose.yml:

```
version: "3"
services:
  fluentd:
    build: "./fluentd"
    ports:
      - "24224:24224"
    network_mode: "host"
  elasticsearch:
    image: elasticsearch:7.4.1
    ports:
      - "9200:9200"
      - "9300:9300"
    environment:
      - discovery.type=single-node
  kibana:
    image: kibana:7.4.1
    links:
      - "elasticsearch"
    ports:
      - "5601:5601"
  web:
    build: .
    ports:
      - "3000:3000"
    links:
      - fluentd
    restart: always
    logging:
      driver: "fluentd"
      options:
        fluentd-address: "localhost:24224"
        tag: "docker.logging_driver.masashi.sada"
        fluentd-async-connect: "true"

```
Fire up the container:

```
vagrant@sivakumarvunnam:~/Dockerizing-NodeApp-ELK$ docker-compose up -d --build

```
