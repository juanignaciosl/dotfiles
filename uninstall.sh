#!/usr/bin/env bash

# Here we go.. ask for the administrator password upfront and run a
# keep-alive to update existing `sudo` time stamp until script has finished
sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Get current directory into a variable (so run this script from anywhere)

export DOTFILES_DIR EXTRA_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXTRA_DIR="$HOME/.extra"

echo "Warning! Uninstall is not finished chet and may produce some undesired actions"
echo "Please. Don't run this script unless you're sure."

read -p "Are you sure? (yes/no)" -n 1 -r
echo    # (optional) move to a new line

if [[ $REPLY =~ ^[Nn]$ ]]
then
  exit 0
fi

####################################################
### Remove Symbolic links to configuration files ###
####################################################

unmount_symbolic_links () {
  unlink ~/.bash_profile
  unlink ~/.inputrc
  unlink ~/.gitconfig
  unlink ~/.gitignore_global
  unlink ~/.gemrc
  unlink ~/.atom
}

unmount_symbolic_links # call function

# TODO: Uninstall all the programs inside "install/" folder.

exit 1