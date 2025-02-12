#!/bin/bash

case $1 in
	start)
		if [[ $(pgrep -f "fifo_server_side.sh" | wc -l) -gt 0 ]]; then
                        echo "Server is started!"
		else
			echo "Server starting..."
			nohup ./fifo_server_side.sh > /dev/null 2>&1 &
			nohup ./verify_if_suspended.sh > /dev/null 2>&1 &
		fi
		;;
	stop)
		if [[ $(pgrep -f "fifo_server_side.sh" | wc -l) -gt 0 ]]; then
                        echo "Server stopping..."
			kill $(pgrep -f "fifo_server_side.sh")
			kill $(pgrep -f "verify_if_suspended.sh")
    	        else
                        echo "Server is not started!"
		fi
		;;
	status)
		if [[ $(pgrep -f "fifo_server_side.sh" | wc -l) -gt 0 ]]; then
			echo "Server is started!"
		else
			echo "Server is not started!"
		fi
		;;
	*)
            echo "Unknown command: $1"
            ;;
esac


exit
