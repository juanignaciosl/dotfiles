# Sources: https://github.com/webpro/dotfiles/blob/c55045c692088105dce3545637d8ab80f120908f/osx/defaults.sh
# Source2: https://github.com/mathiasbynens/dotfiles/blob/master/.osx

SCREENSHOTS_FOLDER="$HOME/Pictures/Screenshots"

#######################
### SYSTEM ###
######################

# Enable Dark Mode
defaults write /Library/Preferences/.GlobalPreferences AppleInterfaceTheme Dark

# Check for software updates daily, not just once per week
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

# Disable the sound effects on boot
sudo nvram SystemAudioVolume=" "

# # Set standby delay to 24 hours (default is 1 hour)
# sudo pmset -a standbydelay 86400
#
# # Disable audio feedback when volume is changed
# defaults write com.apple.sound.beep.feedback -bool false
#



#
# # Disable opening and closing window animations
# defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false
#
# # Increase window resize speed for Cocoa applications
# defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
#
# # Expand save panel by default
# defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
#
# # Expand print panel by default
# defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
#
# # Save to disk (not to iCloud) by default
# defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
#
# # Automatically quit printer app once the print jobs complete
# defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
#
# # Disable the “Are you sure you want to open this application?” dialog
# defaults write com.apple.LaunchServices LSQuarantine -bool false
#
# # Disable Resume system-wide
# defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false
#
# # Disable the crash reporter
# defaults write com.apple.CrashReporter DialogType -string "none"
#
# # Restart automatically if the computer freezes
# sudo systemsetup -setrestartfreeze on
#
# # Disable smart quotes, they're annoying when typing code
# defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
#
# # Disable smart dashes, they're annoying when typing code
# defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
#

#
# ###############################################################################
# # Trackpad, mouse, keyboard, Bluetooth accessories, and input                 #
# ###############################################################################
#
# # Trackpad: enable tap to click for this user and for the login screen
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
# defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
#
# # Trackpad: map bottom right corner to right-click
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
# defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
# defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
#
# # Trackpad: swipe between pages with three fingers
# defaults write NSGlobalDomain AppleEnableSwipeNavigateWithScrolls -bool true
# defaults -currentHost write NSGlobalDomain com.apple.trackpad.threeFingerHorizSwipeGesture -int 1
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerHorizSwipeGesture -int 1
#
# # Increase sound quality for Bluetooth headphones/headsets
# defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
#
# # Enable full keyboard access for all controls
# # (e.g. enable Tab in modal dialogs)
# defaults write NSGlobalDomain AppleKeyboardUIMode -int 3
#
# # Enable access for assistive devices
# echo -n 'a' | sudo tee /private/var/db/.AccessibilityAPIEnabled > /dev/null 2>&1
# sudo chmod 444 /private/var/db/.AccessibilityAPIEnabled
# # TODO: avoid GUI password prompt somehow (http://apple.stackexchange.com/q/60476/4408)
# #sudo osascript -e 'tell application "System Events" to set UI elements enabled to true'
#
# # Use scroll gesture with the Ctrl (^) modifier key to zoom
# defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
# defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
# # Follow the keyboard focus while zoomed in
# defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true
#
# # Disable press-and-hold for keys in favor of key repeat
# defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
#
# # Set a blazingly fast keyboard repeat rate
# defaults write NSGlobalDomain KeyRepeat -int 0
#
# # Automatically illuminate built-in MacBook keyboard in low light
# defaults write com.apple.BezelServices kDim -bool true
# # Turn off keyboard illumination when computer is not used for 5 minutes
# defaults write com.apple.BezelServices kDimTime -int 300
#
# # Set language and text formats
# # Note: if you’re in the US, replace `EUR` with `USD`, `Centimeters` with
# # `Inches`, `en_GB` with `en_US`, and `true` with `false`.
# defaults write NSGlobalDomain AppleLanguages -array "en" "nl"
# defaults write NSGlobalDomain AppleLocale -string "en_US@currency=EUR"
# defaults write NSGlobalDomain AppleMeasurementUnits -string "Centimeters"
# defaults write NSGlobalDomain AppleMetricUnits -bool true
#
# # Set the timezone; see `sudo systemsetup -listtimezones` for other values
# sudo systemsetup -settimezone "Europe/Amsterdam" > /dev/null
#
# # Disable auto-correct
# defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
#
# # Use all F1, F2, etc. keys as standard function keys (requires restart)
# defaults write -g com.apple.keyboard.fnState -bool true

defaults write NSGlobalDomain com.apple.trackpad.scaling -int 2

#
# ###############################################################################
# # Screen                                                                      #
# ###############################################################################
#
# # Require password 5 seconds after sleep or screen saver begins
# defaults write com.apple.screensaver askForPassword -int 1
# defaults write com.apple.screensaver askForPasswordDelay -int 5

# Check screenshots folder exits.
if [ ! -d $SCREENSHOTS_FOLDER ]
then
  mkdir $SCREENSHOTS_FOLDER
fi

# Save screenshots to the desktop
defaults write com.apple.screencapture location -string $SCREENSHOTS_FOLDER

# Save screenshots in PNG format (other options: BMP, GIF, JPG, PDF, TIFF)
defaults write com.apple.screencapture type -string "png"

# # Disable shadow in screenshots
# defaults write com.apple.screencapture disable-shadow -bool true

# # Enable subpixel font rendering on non-Apple LCDs
# defaults write NSGlobalDomain AppleFontSmoothing -int 2

# ###############################################################################
# # Dashboard                                                                   #
# ###############################################################################
#
# # Speed up Mission Control animations
# defaults write com.apple.dock expose-animation-duration -float 0.1
#
# # Disable Dashboard
# defaults write com.apple.dashboard mcx-disabled -bool true
#
# # Don’t show Dashboard as a Space
# defaults write com.apple.dock dashboard-in-overlay -bool true
#
# ###############################################################################
# # Hot corners                                                                 #
# ###############################################################################
#
# # Possible values:
# # 0: no-op
# # 2: Mission Control
# # 3: Show application windows
# # 4: Desktop
# # 5: Start screen saver
# # 6: Disable screen saver
# # 7: Dashboard
# # 10: Put display to sleep
# # 11: Launchpad
# # 12: Notification Center
#
# # Top left screen corner
# defaults write com.apple.dock wvous-tl-corner -int 0
# defaults write com.apple.dock wvous-tl-modifier -int 0
#
# # Top right screen corner
# defaults write com.apple.dock wvous-tr-corner -int 0
# defaults write com.apple.dock wvous-tr-modifier -int 0
#
# # Bottom left screen corner → Display to sleep
# defaults write com.apple.dock wvous-bl-corner -int 10
# defaults write com.apple.dock wvous-bl-modifier -int 0
#
# # Bottom right screen corner
# defaults write com.apple.dock wvous-br-corner -int 0
# defaults write com.apple.dock wvous-br-modifier -int 0
#
# ###############################################################################
# # Safari & WebKit                                                             #
# ###############################################################################
#
# # Set Safari’s home page to `about:blank` for faster loading
# defaults write com.apple.Safari HomePage -string "about:blank"
#
# # Hide Safari’s bookmarks bar by default
# defaults write com.apple.Safari ShowFavoritesBar -bool false
#
# # Disable Safari’s thumbnail cache for History and Top Sites
# defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2
#
# # Hide Safari’s sidebar in Top Sites
# defaults write com.apple.Safari ShowSidebarInTopSites -bool false
#
# # Remove useless icons from Safari’s bookmarks bar
# defaults write com.apple.Safari ProxiesInBookmarksBar "()"
#
# # Allow hitting the Backspace key to go to the previous page in history
# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true
#
# # Enable the Develop menu, the Web Inspector, and the debug menu in Safari
# defaults write com.apple.Safari IncludeInternalDebugMenu -bool true
# defaults write com.apple.Safari IncludeDevelopMenu -bool true
# defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
# defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true
#
# # Add a context menu item for showing the Web Inspector in web views
# defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
#
# ###############################################################################
# # Mail                                                                        #
# ###############################################################################
#
# # Display emails in threaded mode
# defaults write com.apple.mail DraftsViewerAttributes -dict-add "DisplayInThreadedMode" -string "yes"
#
# # Disable send and reply animations in Mail.app
# defaults write com.apple.mail DisableReplyAnimations -bool true
# defaults write com.apple.mail DisableSendAnimations -bool true
#
# # Copy email addresses as `foo@example.com` instead of `Foo Bar <foo@example.com>` in Mail.app
# defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false
#
# # Disable inline attachments (just show the icons)
# defaults write com.apple.mail DisableInlineAttachmentViewing -bool true
#
# # Disable automatic spell checking
# defaults write com.apple.mail SpellCheckingBehavior -string "NoSpellCheckingEnabled"
#
# # Disable sound for incoming mail
# defaults write com.apple.mail MailSound -string ""
#
# # Disable sound for other mail actions
# defaults write com.apple.mail PlayMailSounds -bool false
#
# # Mark all messages as read when opening a conversation
# defaults write com.apple.mail ConversationViewMarkAllAsRead -bool true
#
# ###############################################################################
# # Spotlight                                                                   #
# ###############################################################################
#
# # Hide Spotlight tray-icon (and subsequent helper)
# #sudo chmod 600 /System/Library/CoreServices/Search.bundle/Contents/MacOS/Search
# # Disable Spotlight indexing for any volume that gets mounted and has not yet
# # been indexed before.
# # Use `sudo mdutil -i off "/Volumes/foo"` to stop indexing any volume.
# sudo defaults write /.Spotlight-V100/VolumeConfiguration Exclusions -array "/Volumes"
# # Change indexing order and disable some file types
# defaults write com.apple.spotlight orderedItems -array \
# 	'{"enabled" = 1;"name" = "APPLICATIONS";}' \
# 	'{"enabled" = 1;"name" = "SYSTEM_PREFS";}' \
# 	'{"enabled" = 1;"name" = "DIRECTORIES";}' \
# 	'{"enabled" = 1;"name" = "CONTACT";}' \
# 	'{"enabled" = 1;"name" = "DOCUMENTS";}' \
# 	'{"enabled" = 1;"name" = "PDF";}' \
# 	'{"enabled" = 0;"name" = "FONTS";}' \
# 	'{"enabled" = 0;"name" = "MESSAGES";}' \
# 	'{"enabled" = 0;"name" = "EVENT_TODO";}' \
# 	'{"enabled" = 0;"name" = "IMAGES";}' \
# 	'{"enabled" = 0;"name" = "BOOKMARKS";}' \
# 	'{"enabled" = 0;"name" = "MUSIC";}' \
# 	'{"enabled" = 0;"name" = "MOVIES";}' \
# 	'{"enabled" = 0;"name" = "PRESENTATIONS";}' \
# 	'{"enabled" = 0;"name" = "SPREADSHEETS";}' \
# 	'{"enabled" = 0;"name" = "SOURCE";}'
#
# # Load new settings before rebuilding the index
# killall mds
#
# # Make sure indexing is enabled for the main volume
# sudo mdutil -i on /
#
# # Rebuild the index from scratch
# sudo mdutil -E /
#
# ###############################################################################
# # Terminal                                                                    #
# ###############################################################################
#
# # Only use UTF-8 in Terminal.app
# defaults write com.apple.terminal StringEncodings -array 4
#
# # Use "Pro" theme (black background color)
# defaults write com.apple.terminal "Default Window Settings" -string "Pro"
# defaults write com.apple.terminal "Startup Window Settings" -string "Pro"
#
# # Disable audible and visual bells
# defaults write com.apple.terminal "Bell" -bool false
# defaults write com.apple.terminal "VisualBell" -bool false
#
# ###############################################################################
# # Time Machine                                                                #
# ###############################################################################
#
# # Disable local Time Machine backups
# hash tmutil &> /dev/null && sudo tmutil disablelocal
#
# ###############################################################################
# # Activity Monitor                                                            #
# ###############################################################################
#
# # Show the main window when launching Activity Monitor
# defaults write com.apple.ActivityMonitor OpenMainWindow -bool true
#
# # Visualize CPU usage in the Activity Monitor Dock icon
# defaults write com.apple.ActivityMonitor IconType -int 5
#
# # Show all processes in Activity Monitor
# defaults write com.apple.ActivityMonitor ShowCategory -int 0
#
# # Sort Activity Monitor results by CPU usage
# defaults write com.apple.ActivityMonitor SortColumn -string "CPUUsage"
# defaults write com.apple.ActivityMonitor SortDirection -int 0
#

# ###############################################################################
# # SSD-specific tweaks                                                         #
# ###############################################################################
#
# # Disable local Time Machine snapshots
# sudo tmutil disablelocal
#
###############################################################################
# Dock                                                                        #
###############################################################################

# Show indicator lights for open applications in the Dock
# defaults write com.apple.dock show-process-indicators -bool true

# Don’t animate opening applications from the Dock
# defaults write com.apple.dock launchanim -bool false

# Automatically hide and show the Dock
defaults write com.apple.dock autohide -bool true

# Don't rearrange spaces by MRU
defaults write com.apple.dock mru-spaces -int 0

# Make Dock icons of hidden applications translucent
# defaults write com.apple.dock showhidden -bool true

# No bouncing icons
# defaults write com.apple.dock no-bouncing -bool true
