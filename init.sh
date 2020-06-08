# If no $POLLING_DELAY then default to 0 
if [ -z "$POLLING_DELAY" ]
        then export POLLING_DELAY=60
fi

# echo date, variables and first logger run
date
echo POLLING_DELAY = $POLLING_DELAY

# Main loop - hide output
# Delay set to $POLLING_DELAY
while :
do
  sleep $POLLING_DELAY
  sed -e "s/\${pub_ip}/210.54.33.24/" -e "s/\${domain}/sigtar.com/" /home/root/templates/zone.txt > sigtar.com.zone
  sed -e "s/\${pub_ip}/210.54.33.24/" -e "s/\${domain}/loyalbug.com/" /home/root/templates/zone.txt > loyalbug.com.zone
done
