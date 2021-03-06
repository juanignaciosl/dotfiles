#!/bin/bash
### This script launch all the files inside osx.

COMPUTER_NAME="juanignaciosl"

# Here we go.. ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo
echo "********************"
echo "*** Mac Defaults ***"
echo "********************"
echo
echo "SETTING MAC Defaults..."
echo

###############################################################################
# General UI/UX                                                               #
###############################################################################

# Set computer name (as done via System Preferences → Sharing)
sudo scutil --set ComputerName "$COMPUTER_NAME"
sudo scutil --set HostName "$COMPUTER_NAME"
sudo scutil --set LocalHostName "$COMPUTER_NAME"
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "$COMPUTER_NAME"

############################
### Setting mac defaults ###
############################

for DEFAULTS_FILE in "$DOTFILES_DIR"/osx/defaults/*.sh; do
    echo "Applying $DEFAULTS_FILE" && . "$DEFAULTS_FILE"
done

echo "Done. Some changes may require a logout/restart to take effect."

#################################
### Setting dock applications ###
#################################

. "$DOTFILES_DIR/osx/dock.sh"

##################################
### Kill affected applications ###
##################################

for app in "Address Book" "Calendar" "Contacts" "Dock" "Finder" "Mail" "SystemUIServer" "iCal"; do
    killall "${app}" &> /dev/null
done

killall SystemUIServer

echo
echo "SETTED MAC DEFAULTS..."
echo
