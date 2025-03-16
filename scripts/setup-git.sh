#!/bin/bash

echo "Git setup script by github.com/bangueco"

# Initialize default settings here
git config --global init.defaultBranch main

# For setting up git username
echo "Enter your git username: "
read gitUsername

echo "Setting git username..."
git config --global user.name $gitUsername

# For setting up git email
echo "Enter your git email: "
read gitEmail

echo "Setting git email..."
git config --global user.email $gitEmail

# For setting up git ssh
generateKey=""
while [ -z "$generateKey" ]  # Check if the variable is empty
do
  echo "Do you want to generate an SSH key for Git? Y/N: "
  read generateKey

  if [ "$generateKey" == "Y" ] || [ "$generateKey" == "y" ]
  then
    echo "Generating SSH key..."
    read -p "Enter your email: " sshEmail
    ssh-keygen -t ed25519 -C "$sshEmail"
    cat ~/.ssh/id_ed25519.pub
    break  # Exit the loop after generating the key
  elif [ "$generateKey" == "N" ] || [ "$generateKey" == "n" ]
  then
    echo "Exiting..."
    break  # Exit the loop if the user doesn't want to generate the key
  else
    echo "Invalid input! Please enter Y or N."
    generateKey=""  # Reset the variable to prompt the user again
  fi
done