#!/bin/bash

source /home/teominea/Desktop/facultate/ITBI/proiect/config.sh

while true; do

    PIDS=$(pgrep -f "fifo_client_side.sh")
    if [ -n "$PIDS" ]; then
        for PID_OF_CLIENT in $PIDS; do
                if ps -o stat= -p ${PID_OF_CLIENT} | grep -q 'T'; then
                        myFifo=${REPLY_PATH}${PID_OF_CLIENT}
			rm $myFifo
			pgrep -P "${PID_OF_CLIENT}" | xargs -r kill -9
			kill -9 ${PID_OF_CLIENT}
		fi
        done
    fi
    sleep 0.2
done
