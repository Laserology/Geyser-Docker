# Geyser-Docker
This repository contains the Dockerfile and example docker compose scripts for running GeyserMC inside a docker container

## Run With Normal Online Mode
### Using docker run
```bash
docker run -it -d --network host --restart always --name GeyserMC -e address=YourServerIP -e savelogin=Username OR Username1\ Username2 ghcr.io/laserology/geyser-docker:main
```

#### Using Docker Compose:
```yml
services:
  GeyserMC:
    container_name: Geyser
    image: ghcr.io/laserology/geyser-docker:main
    restart: always
    environment:
      - address=YourServerIP
      - port=YourServerPort
      - savelogin=Usename
      OR
      - savelogin=Username1\ Username2\ etc...
    networks-mode: host
```

### Floodgate-Enabled Setup

For running GeyserMC with Floodgate authentication:

#### Using docker run:
```bash
docker run -it -d --network host --restart always --name geyser-mc -e auth=floodgate -e key=/key.pem -e address=localhost -e savelogin=Username OR Username1\ Username2 ghcr.ghcr.io/your-repo/eyser-docker:main
```

#### Using Docker Compose:
```yml
services:
  GeyzerMC:
    container_name: Geyzer
    image: ghcr.ghcr.io/your-repo/eyser-docker:main
    restart: always
    environment:
      - address=YourServerIP
      - port=YourServerPort
      - savelogin=Usename
      OR
      - savelogin=Username1\ Username2\ etc...
      - auth=floodgate
      - key=/key.pem
    volumes:
      - ./key.pem:/key.pem
    network-mode: host
```

> Note that you must copy the remote or local server's key.pem file (generated in config/geyser/ folder) and place it in a permenant directory to use in this container for it to work.

# Automatic updates
You can automate container updates usin this script:

```bash
docker stop GeyserMC
docker rm GeyserMC
docker pull ghcr.io/laserology/geyser-docker:main
docker run -it -d --network host --name GeyserMC -v ${PWD}/key.pem:/key.pem -e auth=floodgate -e address=localhost ghcr.io/laserology/geyser-docker:main
```

This script will stop, remove, re-download the image, and re-run the container with the same settings every time.
Simply edit the ``docker run`` line to fit your needs, such as changing the remote server address, port, or enabling floodgate. 
