#!/bin/bash

if [[ $(cat /etc/hostname) -eq "archlab" ]]
then
  echo "this is the lab computer"
  sh ~/.config/scripts/monitors-dual.sh
fi

if [[ $(cat /etc/hostname) -eq "archtop" ]]
then
  echo "this is the laptop"
fi
