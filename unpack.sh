#!/bin/bash

directories=$(ls -d -- */)

# Exit the program if there are already dotfiles present
any_config_already_exists=false
for directory in $directories; do
  if [ -d "../$directory" ]; then
    echo "Error: configuration for $directory already exists"
    any_config_already_exists=true
  fi
done

if [ "$any_config_already_exists" = true ]; then
  echo "Exiting program"
  exit 1
fi

# Create a symbolic link for each of the dotfiles
cd ~/.config || exit 1

for directory in $directories; do
  ln -s dotfiles/"$directory" "${directory::-1}"
done
