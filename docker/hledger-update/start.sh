#!/bin/bash

ls ~/ssh-keys

# add the private key to the ssh agent
eval $(ssh-agent -s)
ssh-add ~/ssh-keys/id_rsa

# scan github keys
ssh-keyscan github.com > ~/.ssh/known_hosts

# clone repo
git clone git@github.com:dat2/hledger-transactions.git

# TODO update the script

# git add .
# git commit -m "update by k8s"
# git push origin master
