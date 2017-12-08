FROM kmallea/steamcmd:latest

MAINTAINER Mikel Farley <Mikel@Farley.pro>

RUN ./steamcmd.sh +login anonymous +force_install_dir /GameServer/Killing_Floor_2 +app_update 232130 validate +quit

RUN timeout 20s /GameServer/Killing_Floor_2/Binaries/Win64/KFGameSteamServer.bin.x86_64 &1> /dev/null 2> /dev/null

ADD kf2-config/ /GameServer/Killing_Floor_2/KFGame/Config

EXPOSE 7777/UDP 27015/UDP 20560/UDP 123/UDP 8080/TCP 

ENTRYPOINT ["/GameServer/Killing_Floor_2/Binaries/Win64/KFGameSteamServer.bin.x86_64"]
