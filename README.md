# valheim
This repo contains the tutorial and relevant script files to perform backup/restore functions for a dedicated Valheim server on Ubuntu Linux. 

Files Included
1. snapshot.sh
2. rpo.sh
3. restore.sh

How it all works

You setup global cron jobs to execute snapshot.sh on an interval of your choosing. The snapshot.sh file basically grabs the world.db and world.fwl files from the worlds' directory (/home/steam/.config/unity3d/IronGate/Valheim/worlds), puts them into a tar.gz file with a date/time stamp in the filename, and parks it into a separate user directory called ".snaps". You run another cron job to execute rpo.sh that deletes tar.gz files aka snapshots older than 1 day or whatever you want to it be. The restore.sh is a shell based menu that dynamically populates a list of snapshots for you to choose from in order to restore. Upon selecting which snapshot you want to restore, restore.sh will shut down the game server daemon, unpacks the tar.gz file back into the worlds directory, and then starts the server daemon up again. 






