#!/bin/bash
##local light colorization variables

red=$'\e[1;31m'
grn=$'\e[1;32m'
blu=$'\e[1;34m'
cyn=$'\e[1;36m'
wht=$'\e[1;37m'
mag=$'\e[1;35m'
ylw=$'\e[1;33m'

clear
echo $ylw "Valheim Snapshot Restoration Tool v1.0"
echo $grn "by WesleySakamoto"$wht
# set the prompt used by select, replacing #?"
PS3="Enter a number for the snapshot you want to restore (or type q to Quit):"


# allow the user to choose a file
cd /home/valheim/.snaps/
select filename in *.tar.gz 
do
    # kill loop with q
    if [[ "$REPLY" == q ]]; then 
    echo $red "Quitting"$wht	
    break; 
    fi

    # complain if no file was selected, and loop to ask again
    if [[ "$filename" == "" ]]
    then
        echo "'$REPLY' is invalid. Please select again."
        continue
    fi

    # now we can use the selected file
    echo "You have chosen to restore $filename. Beginning Restoration Procedures.."
    echo "Stopping Valheim Server.."
    sudo systemctl stop valheimserver
    sleep 10s
    echo "Unpacking files to production worlds' directory. Please Stand By..."
    #unpacks tar into target worlds folder (add v flag for verbose loggin when testing'
    sudo tar xzf $filename -C /home/steam/.config/unity3d/IronGate/Valheim/worlds/
    #ensures correct permissions on restored world files (uncomment if -p flag was not used during snap creation)
    #sudo chown steam:steam -R /home/steam/.config/unity3d/IronGate/Valheim/worlds/
    echo "Unpacking Completed. Starting up Valheim server.."
    sudo systemctl start valheimserver
    sleep 20s
    echo "Restoration Completed, SKAL!"
    # it'll ask for another unless we leave the loop
    break
done
