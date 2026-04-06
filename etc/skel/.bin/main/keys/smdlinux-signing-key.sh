##!/bin/bash
#set -e
#
##########################################################
#                                                        #
#                  SMD-Linux script                      #
#                                                        #
#  Inspired and Forked From                              #
#  https://github.com/SofianeHamlaoui/ArchI0             #
#  And                                                   #
#  https://github.com/arcolinuxd                         #
##########################################################
#  +FIRST  : sudo chmod +x smdlinux-signing-key.sh       #
#                (Give EXEC Access To Script)            #
#  +TO RUN    : ./smdlinux-signing-key.sh                #
##########################################################
#                                                        #
#                DO NOT JUST RUN THIS.                   #
#       EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.         #
#                                                        #
##########################################################
#
#
#  TO DO:
#
#
######################## Variables #######################
#
# b=bold u=underline bl=black r=red g=green
# y=yellow bu=blue m=magenta c=cyan w=white
# endc=end-color enda=end-argument
b='\033[1m'
u='\033[4m'
bl='\E[30m'
r='\E[31m'
g='\E[32m'
y='\E[33m'
bu='\E[34m'
m='\E[35m'
c='\E[36m'
w='\E[37m'
endc='\E[0m'
enda='\033[0m'
version="20210131"

##########################################################

#smdlinux key
sudo pacman-key --recv-keys BB31837564255477
sudo pacman-key --lsign-key BB31837564255477

echo -e " [${g}✔${endc}]::Signing Key has been installed${endc}${enda}"
echo
echo -e " ${bu}SMD-Linux Installation Script Version${b} $version ${enda} ${endc}"


echo "If you get an error -- Remote key not fetched correctly from keyserver"
echo
echo "Add one of these lines to /etc/pacman.d/gnupg/gpg.conf"
echo "keyserver hkp://keyserver.ubuntu.com:80"
echo "keyserver hkps://keyserver.ubuntu.com"
echo "keyserver hkps://keys.openpgp.org"
