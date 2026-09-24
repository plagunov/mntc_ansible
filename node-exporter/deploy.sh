#!/bin/bash
#
SECONDS=0
convertsecs() {
 h=$(bc <<< "${1}/3600")
 m=$(bc <<< "(${1}%3600)/60")
 s=$(bc <<< "${1}%60")
 printf "%02d:%02d:%05.2f\n" $h $m $s
}

ansible all -m ping
ansible-playbook node_exporter.yml -vvvv
#
#ansible all -m ping --ask-pass -vvvv
#ansible-playbook node_exporter.yml --ask-pass --ask-become-pass -vvvv

convertsecs $SECONDS
