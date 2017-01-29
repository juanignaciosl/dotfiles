#!/bin/bash

echo
echo "********************"
echo "*** Install gems ***"
echo "********************"
echo

gems=(
  tmuxinator
)

gem install "${gems[@]}"
