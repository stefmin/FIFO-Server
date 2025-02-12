#!/bin/bash

source /home/teominea/Desktop/facultate/ITBI/proiect/config.sh
WELL_KNOWN_FIFO=$SERVER_PATH
if [ -p "$WELL_KNOWN_FIFO" ]; then
	rm $WELL_KNOWN_FIFO
fi

mkfifo $WELL_KNOWN_FIFO

while [ "1" == "1" ]; do
        request=$(cat $WELL_KNOWN_FIFO)

        if [[ "$request" =~ BEGIN-REQ\ \[([0-9]+):\ ([a-zA-Z0-9_-]+)\]\ END-REQ ]]; then
                CLIENT_PID="${BASH_REMATCH[1]}"
                COMMAND_NAME="${BASH_REMATCH[2]}"

                personalFifo=$REPLY_PATH
                personalFifo+=$CLIENT_PID
                mkfifo $personalFifo

                if [ ! "$(which $COMMAND_NAME)" == "" ]; then
			man ${COMMAND_NAME} > $personalFifo
                else
                        echo "Command doesn't exist $COMMAND_NAME" > $personalFifo
                fi
        else
                echo "Invalid request format: $request"
	fi
	rm $personalFifo
done

