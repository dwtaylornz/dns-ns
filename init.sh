# If no $POLLING_DELAY then default to 0 
if [ -z "$POLLING_DELAY" ]
        then export POLLING_DELAY=60
fi

# echo date, variables and first logger run
date
echo POLLING_DELAY = $POLLING_DELAY

#setup
sed -e "s/\${pub_ip}/210.54.33.24/" -e "s/\${domain}/sigtar.com/" zone.txt > sigtar.com.zone
sed -e "s/\${pub_ip}/210.54.33.24/" -e "s/\${domain}/loyalbug.com/" zone.txt > loyalbug.com.zone  
rc-update add named

# Main loop
# Delay set to $POLLING_DELAY
cd /etc/bind

while :
do
  IP=$(curl -s ifconfig.co)
  echo "$IP"
  sed -e "s/\${pub_ip}/210.54.33.24/" -e "s/\${domain}/sigtar.com/" zone.txt > sigtar.com.zone
  sed -e "s/\${pub_ip}/210.54.33.24/" -e "s/\${domain}/loyalbug.com/" zone.txt > loyalbug.com.zone  
  sleep $POLLING_DELAY
done
