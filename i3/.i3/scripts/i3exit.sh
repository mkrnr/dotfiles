#!/bin/sh
lock() {
  slimlock
}

case "$1" in
    lock)
        lock
        ;;
#    logout)
#        i3-msg exit
#        ;;
    suspend)
        systemctl suspend
        ;;
    reboot)
        systemctl reboot
        ;;
    poweroff)
        systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|suspend|reboot|shutdown}"
        exit 2
esac

exit 0
