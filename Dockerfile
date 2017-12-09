FROM ubuntu:14.04
MAINTAINER Mikel Farley <Mikel@Farley.pro>

ENV DEBIAN_FRONTEND noninteractive

# Install dependencies
RUN apt-get update && \
    apt-get install -y curl lib32gcc1

# Download and extract SteamCMD
RUN mkdir -p /opt/steamcmd && \
    cd /opt/steamcmd && \
    curl -s http://media.steampowered.com/installer/steamcmd_linux.tar.gz | tar -vxz

RUN /opt/steamcmd/steamcmd.sh +login anonymous +force_install_dir /GameServer/Killing_Floor_2 +app_update 232130 validate +quit

RUN timeout 20s /GameServer/Killing_Floor_2/Binaries/Win64/KFGameSteamServer.bin.x86_64 &1> /dev/null 2> /dev/null

ADD kf2-config/ /GameServer/Killing_Floor_2/KFGame/Config

EXPOSE 7777/UDP 27015/UDP 20560/UDP 123/UDP 8080/TCP 

ENTRYPOINT ["/GameServer/Killing_Floor_2/Binaries/Win64/KFGameSteamServer.bin.x86_64"]
