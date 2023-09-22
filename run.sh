#!/bin/bash

export MODE=${RUN_MODE}
RETCODE=0

case ${MODE} in
	client)
	 	/usr/local/bin/client.sh
		;;
	server)
		/usr/local/bin/server.sh
		;;
	*)
		echo "Unknown mode: ${MODE}"
		sleep 5
		RETCODE=1
		;;
esac

exit ${RETCODE}
