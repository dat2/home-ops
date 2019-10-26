#!/bin/bash

# scan github keys so that we can clone
ssh-keyscan github.com > ~/.ssh/known_hosts

# clone repo
git clone git@github.com:dat2/hledger-transactions.git

# TODO update the script

# git add .
# git commit -m "update by k8s"
# git push origin master
