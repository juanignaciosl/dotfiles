#!/bin/bash

echo
echo "**************************"
echo "*** Brew cask programs ***"
echo "**************************"
echo
echo "INSTALLING MAC Applications..."
echo

# Install Caskroom
brew tap caskroom/cask
brew tap caskroom/versions

applications_to_install=(
    # Drivers
    wacom-bamboo-tablet

    # Essentials
    # flux
    iterm2
    cleanmymac
    the-unarchiver # zips, rar, and more
    caffeine # Mac will never sleep
    spectacle # resize windows
    skyfonts
    # superduper # Recoveries

    # Browsers
    # opera
    google-chrome
    # google-chrome-canary
    firefox
    # firefoxdeveloperedition

    # Machine Learning
    # octave

    # Cloud storage
    dropbox
    google-drive

    java

    # Text Editors
    # atom
    # macdown
    # sublime-text3
    intellij-idea
    meld

    # Dev
    dash
    # mongohub
    # zeplin
    # sourcetree # Git IDE

    # Messages
    # skype
    slack
    telegram
    # google-hangouts

    # Multimedia
    vlc
    # vox
    spotify
    # slate # snapshot
    # imageoptim # image optimizer
    licecap # record screen and make gif
    screenflow # Screen Recording
    pocketcast # podcasts

    ### OTHERS ###
    # mactracker
    # cyberduck # FTP
    # transmit # FTP. Paid application
    little-snitch # Network analyzer
    # hammerspoon # This is a tool for powerful automation of OS X
    # spark # Shortcuts manager
    android-file-transfer
    cheatsheet
    virtualbox #  virtualization software
    duet # Ipad to screen
    # bitbar
    # gpgtools # GPG Keychain and more GPG stuff
    # sqlitestudio # See SQL squemas
    # kindle
    # send-to-kindle
    calibre
    # simpless
    #clamxav # antivirus
    #easyfind # finder with steroids
    rescuetime
    disk-inventory-x
    avast
    tunnelblick
)

brew cask install "${applications_to_install[@]}"

########################################################
### Launch the following applications to set them up ###
########################################################

applications_to_open=(
    # flux # Setup day to wake up
    dropbox # Start Syncing files
    spotify # Connect account
    "little-snitch"
    "Google chrome" # Setup google account
    "google drive" # Start Syncing files
    RescueTime
    Tunnelblick
)

for i in "${applications_to_open[@]}"
do
    echo "=> Opening:" $i
    open -a "$i"
done
