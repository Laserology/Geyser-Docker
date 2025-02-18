FROM debian:latest

ENV ServerIP=localhost
ENV ServerPort=25565

LABEL "com.example.vendor"="Laserology"
LABEL version="1.0"
LABEL description="A simple docker file to run a geyser server with automatic updates."

EXPOSE 19132/udp
EXPOSE 19133/udp

# Perform updates
RUN apt update

# Install the application dependencies
RUN apt install openjdk-17-jre wget -y

# Copy in geyser
RUN mkdir /Geyser
RUN wget -O /Geyser/standalone https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone

# Run geyser
CMD java -jar /Geyser/standalone --remote.address=$ServerIP --remote.port=$ServerPort
