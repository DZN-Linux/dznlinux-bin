#!/bin/bash
set -e
##################################################################################################################
# Author	:	Erik Dubois
# Website	:	https://www.erikdubois.be
# Website	:	https://www.arcolinux.info
# Website	:	https://www.arcolinux.com
# Website	:	https://www.arcolinuxd.com
# Website	:	https://www.arcolinuxb.com
# Website	:	https://www.arcolinuxiso.com
# Website	:	https://www.arcolinuxforum.com
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################

DE="${XDG_CURRENT_DESKTOP:-}"

if [[ "$DE" == *"KDE"* ]] || [[ "$DE" == *"plasma"* ]]; then
    echo "################################################################"
    echo "####  KDE Plasma detected — Bluetooth is managed by BlueDevil."
    echo "####  Enable the Bluetooth applet in System Settings >         "
    echo "####  System Tray Settings if the icon is missing.             "
    echo "################################################################"
else
    # For non-KDE desktops using Blueberry (GNOME, Xfce, MATE, etc.)
    gsettings set org.blueberry use-symbolic-icons false
    echo "################################################################"
    echo "####                  reboot or logout                    ######"
    echo "################################################################"
fi
