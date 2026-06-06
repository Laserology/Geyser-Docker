FROM alpine:latest

ENV address=localhost
ENV port=25565
ENV auth=online
ENV key=key.pem
ENV savelogin=Notch\ Herobrine

LABEL "net.laserology.software"="Laserology"
LABEL version="1.0"
LABEL description="A simple docker file to run a geyser server with automatic updates."

EXPOSE 19132/udp
EXPOSE 19133/udp

# Install the application dependencies
RUN apk add openjdk21 wget

# Copy in geyser
RUN mkdir /Geyser
RUN wget -O /Geyser/standalone https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone

# Run geyser
CMD java -jar /Geyser/standalone --saved-user-logins=$savelogin --remote.address=$address --remote.port=$port --remote.auth-type=$auth --floodgate-key-file=$key
