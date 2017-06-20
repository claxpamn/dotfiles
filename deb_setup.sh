#!/bin/sh

echo "Starting!"
cd dotfiles

stow vim -t ~ > /dev/null 2>&1

# stow -D vim -t ~ > /dev/null 2>&1

