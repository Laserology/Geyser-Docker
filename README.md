# Geyser-Docker
This repository contains the Dockerfile and example docker compose scripts for running GeyserMC inside a docker container

# Running
### Via run:
```
docker run -it -d --network host --restart always --name GeyserMC -e ServerIP=YourServerIP ghcr.io/laserology/geyser-docker:main
```
### Via compose:
```yml
services:
  Geyser-MC:
    container_name: Geyser
    image: ghcr.io/laserology/geyser-docker:main
    restart: always
    environment:
      - address=YourServerIP
      - port=YourServerPort
      - auth=floodgate/online (optional, default floodgate)
      - key=/path/to/floodgate/key.pem (Needed for floodgate. Generated when the server runs with the mod installed.)
    network_mode: host
```
