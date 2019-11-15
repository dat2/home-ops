#!/bin/bash

# add the private key to the ssh agent
eval $(ssh-agent -s)
ssh-add ~/ssh-keys/id_rsa

# scan github keys
ssh-keyscan github.com > ~/.ssh/known_hosts

# clone repo and cd into it to work in it
git clone git@github.com:dat2/hledger-transactions.git
cd hledger-transactions

# use the last date reported from the journal +1 day.
export LEDGER_FILE=$PWD/.hledger.journal
LAST_DATE_IN_JOURNAL=$(hledger activity | tail -n 1 | cut -d' ' -f1 | xargs date '+%Y/%m/%d' -d)
EXPORT_START_DATE=$(date -d "$LAST_DATE_IN_JOURNAL + 1 day" '+%Y/%m/%d')

echo "updating from $EXPORT_START_DATE to $(date '+%Y/%m/%d')"
hledger-exporter $EXPORT_START_DATE >> .hledger.journal

# copy git config so we can commit
cp /conf/.gitconfig ~/.gitconfig

# commit and push
git add .
git commit -m "update from $LAST_DATE_IN_JOURNAL to $EXPORT_START_DATE"

# git push origin master
