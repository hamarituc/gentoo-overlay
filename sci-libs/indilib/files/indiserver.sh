#!/sbin/openrc-run

if [ ! "${INDISERVER_USER}" ]; then
        INDISERVER_USER="indiserver"
fi

description="indiserver - INDI astronomical control library server"
command="/usr/bin/indiserver"

if [ "${INDISERVER_FIFO}" ]; then
        command_args="${INDISERVER_OPTS} -f ${INDISERVER_FIFO} ${INDISERVER_DRIVERS}"
else
        command_args="${INDISERVER_OPTS} ${INDISERVER_DRIVERS}"
fi

pidfile="/var/run/indiserver.pid"
start_stop_daemon_args="--pidfile ${pidfile} --make-pidfile --background --user ${INDISERVER_USER}"

start_pre() {
        IFS=' ' read -ra DRIVER <<< "${INDISERVER_DRIVERS}"
        for file in "${DRIVER[@]}"; do
                if [ ! -x /usr/bin/"${file}" ]; then
                        eerror "Driver ${file} not found. Please check configuration file."
                        exit 1
                fi
        done
        if [ "${INDISERVER_FIFO}" ]; then
                INDISERVER_OPTS="-f ${INDISERVER_FIFO} ${INDISERVER_OPTS}"
                if [ ! -p "${INDISERVER_FIFO}" ]; then
                        if ! /usr/bin/mkfifo ${INDISERVER_FIFO}; then
                        eerror "Could not create FIFO file in ${INDISERVER_FIFO}!"
                        eerror "indiserver is started with user ${INDISERVER_USER}"
                        eerror "Check permissions or unset INDISERVER_FIFO in config."
                        exit 1
                        fi
                        chown indiserver:indiserver ${INDISERVER_FIFO}
                else
                        ewarn "Strange. FIFO file ${INDISERVER_FIFO} already exists"
                fi
        fi
        return 0
        }

stop_post() {
        if [ -p "${INDISERVER_FIFO}" ]; then
                rm -rf "${INDISERVER_FIFO}"
        fi
        return 0
        }
