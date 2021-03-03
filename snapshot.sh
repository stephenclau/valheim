#This shell script contains the line by line logic for capturing world progression as of a point in time.
#--version 1.0
#--grabs .db and .fwl files and wraps into tar.gz that is appended with datetime stamp on create
#set world variable
echo "Targeting Slauhalla"
world=Slauhalla
echo "Target Acquired"
#tar world progession files with datetimestamp
echo "Snapshot Starting..."
sudo tar pczf /home/valheim/.snaps/$world.$(date +%Y%m%d_%H%M).tar.gz -C /home/steam/.config/unity3d/IronGate/Valheim/worlds $world.db $world.fwl
echo "Snapshot Complete"
