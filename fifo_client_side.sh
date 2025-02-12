#!/bin/bash

if [ "$#" == "0" ]
then
        echo "No Arguments Given"
        exit
fi

source /home/teominea/Desktop/facultate/ITBI/proiect/config.sh
WELL_KNOWN_FIFO=$SERVER_PATH
CLIENT_ID=$$
echo "BEGIN-REQ [$(echo $CLIENT_ID): $1] END-REQ" > $WELL_KNOWN_FIFO
myFifo=${REPLY_PATH}${CLIENT_ID}
cleanup() {
	if [ -e "$myFifo" ]; then
		rm "$myFifo"
	fi
}
trap cleanup SIGHUP SIGINT SIGTERM EXIT
less -f $myFifo
if [ -e "$myFifo" ]; then
	rm $myFifo
fi
exit
