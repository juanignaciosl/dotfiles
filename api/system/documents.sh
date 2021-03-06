#!/bin/bash

echo
echo "=> Setup my documents folder"
echo "Creating folders and making symbolic links to google drive or dropbox"
echo "Here you can define the folders that your Documents directory will have"
echo "And make symbolic links to your Google Drive or Dropbox in order to"
echo "always have all your files synchronised between your computers"
echo

read -p "Have you setup Google Drive account? [y/N]" -n 1 -r
echo    # (optional) move to a new line

if [[ $REPLY =~ ^[Nn]$ ]]
then
  open -a "Google Drive" # open Google drive to let the user login
  read -p 'Press [Enter] when you have set up Google Drive...'
fi

# TODO: Add to check if google drive has been set up

#########################################
### Creating git folders on Documents ###
#########################################

echo
echo "=> Creating Folders to contain git repositories"
echo "These folders will not have been linked to Google Drive"
echo

git_folders=(
  Gitlab
  Github
  BitBucket
)

for FOLDER in "${git_folders[@]}"
do
  mkdir -p "$HOME/Documents/$FOLDER" # -p => creates parent directory if not exists
done

############################################################
### Create symbolic links from Google Drive to Documents ###
############################################################

echo
echo "=> Now link some folders from Google Drive"
echo "to have them synchronised in all your devices"
echo

folders=(
  Work-office
  University
  Virtual-documents
)

for FOLDER in "${folders[@]}"
do

    # If symbolic link already exists. Don't create again and evict recursion
    # test if file exists (test actual file, not symbolic link)
    if [ ! -e "$HOME/Documents/$FOLDER" ] ; then
      # symlink is broken or does not exist
      #ln -s <real_folder> <linked_folder>
      echo "=> Symbolic link broken or does not exit. Create it"
      #mkdir -p "$HOME/Google Drive/$FOLDER" # -p => creates parent directory if not exists
      echo "   Creating symbolic link to Google drive on Documents" $FOLDER
      ln -sfv "$HOME/Google Drive/$FOLDER" "$HOME/Documents/$FOLDER"
    fi

done
