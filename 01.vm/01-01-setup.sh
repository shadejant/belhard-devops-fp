#!/bin/bash

ssh-keygen -f "/home/jant/.ssh/known_hosts" -R "bh-k3s"
ssh-copy-id k3s@bh-k3s
echo "ssh k3s@bh-k3s       add 'k3s ALL=(ALL:ALL) NOPASSWD:ALL' into /etc/sudoers.d/k3s"