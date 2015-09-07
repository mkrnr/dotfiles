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
        sudo systemctl suspend
        ;;
    reboot)
        sudo systemctl reboot
        ;;
    poweroff)
        sudo systemctl poweroff
        ;;
    *)
        echo "Usage: $0 {lock|suspend|reboot|shutdown}"
        exit 2
esac

exit 0
