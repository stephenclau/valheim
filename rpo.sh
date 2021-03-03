##!bin/bash
## RPO means recovery point objective. It is an enterprise policy in DR scenarios to specify how far back an enterprise is willing start over 
## in the event of a failure. (acceptable data loss)
## This script will delete snapshots over the RPO target time of 1 day.
## mtime only works in days; mmin only works for mins.
rpo=1
echo "Removing Snapshots Older than 24hours.." 
sudo find /home/valheim/.snaps/ -name *.tar.gz -mtime +$rpo -type f -exec rm -f {} \; 
echo "RPO Enforcement Complete"
