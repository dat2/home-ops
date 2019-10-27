#!/bin/bash

# add the private key to the ssh agent
eval $(ssh-agent -s)
ssh-add ~/ssh-keys/id_rsa

# scan github keys
ssh-keyscan github.com > ~/.ssh/known_hosts

# clone repo and cd into it to work in it
git clone git@github.com:dat2/hledger-transactions.git
cd hledger-transactions

# update the script, print yesterdays transactions, since
# we'll be running at midnight every day
YESTERDAY=$(date -d yesterday '+%Y/%m/%d')
echo $YESTERDAY
hledger-exporter export -s $YESTERDAY >> .hledger.journal

# copy git config so we can commit
cp /conf/.gitconfig ~/.gitconfig

# commit and push
git add .
git commit -m "update: $YESTERDAY"
# git push origin master
