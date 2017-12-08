# gameserver-kf2
This is a Docker Buildfile for running a Killing Floor 2 server.

Download & prep with `git clone https://github.com/QantumEntangled/gameserver-kf2.git && cd gameserver-kf2` and edit the config files in the kf2-config folder.

Build with `docker build -t gameserver-kf2 ./` and run with `docker run -dt --name kf2-server --network host gameserver-kf2`.

If you want to enable to WebAdmin capability you'll need to run `docker exec -it kf2-server /bin/bash` and then edit the `/GameServer/Killing_Floor_2/KFGame/Config/KFWeb.ini` file (install nano or vim as needed). The default password is "password"
