# Geyser-Docker
This repository contains the Dockerfile and example docker compose scripts for running GeyserMC inside a docker container

# Running
### Via run:
```
docker run --network host -e ServerIP=YourServerIP ghcr.io/laserology/geyser-docker
```
### Via compose:
```yml
services:
	Geyser-MC:
		container_name: Geyser
		image: Laserology/GeyserMC
		restart: always
		environment:
			- ServerIP=YourServerIP
		network_mode: host
```
