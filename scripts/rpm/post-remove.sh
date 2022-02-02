#!/bin/bash

function disable_systemd {
    systemctl disable telegraf
    rm -f $1
}

function disable_update_rcd {
    update-rc.d -f telegraf remove
    rm -f /etc/init.d/telegraf
}

function disable_chkconfig {
    chkconfig --del telegraf
    rm -f /etc/init.d/telegraf
}

# InfluxDB is no longer installed, remove from init system
if [[ "$1" = "0" ]]; then
    rm -f /etc/default/telegraf
fi

if [[ "$(readlink /proc/1/exe)" == */systemd ]]; then
    if [[ $1 -ge 1 ]]; then
        systemctl try-restart telegraf.service >/dev/null 2>&1 || :
    else
        disable_systemd /usr/lib/systemd/system/telegraf.service
    fi
else
    disable_chkconfig
fi
