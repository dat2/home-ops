#!/bin/bash

# add the private key to the ssh agent
eval $(ssh-agent -s)
ssh-add ~/ssh-keys/id_rsa

# scan github keys
ssh-keyscan github.com > ~/.ssh/known_hosts

# clone repo and cd into it to work in it
git clone git@github.com:dat2/hledger-transactions.git $REPO_LOCATION
