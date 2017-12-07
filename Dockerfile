FROM kmallea/steamcmd:latest

MAINTAINER Mikel Farley <Mikel@Farley.pro>

EXPOSE 7777 27015 20560 123

RUN ./steamcmd.sh +login anonymous +force_install_dir /GameServer/Killing_Floor_2 +app_update 232130 validate +quit

ADD kf2-config/ /GameServer/Killing_Floor_2/KFGame/Config

ENTRYPOINT ["/GameServer/Killing_Floor_2/Binaries/Win64/KFGameSteamServer.bin.x86_64"]
