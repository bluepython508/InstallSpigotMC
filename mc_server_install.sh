#!/bin/bash
mkdir server
cd server
mkdir buildtools
mkdir spigot
cd buildtools
wget -O BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
sudo apt-get install git openjdk-8-jre-headless tar
git config --global --unset core.autocrlf
java -jar BuildTools.jar
mv spigot-* ../spigot/spigot.jar
cd ../spigot
echo "#!/bin/bash
java -Xms512M -Xmx1G -XX:+UseConcMarkSweepGC -jar spigot.jar
" > start.sh
chmod 777 start.sh
bash start.sh

