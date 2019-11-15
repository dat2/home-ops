# home-ops

This is my repo of personal projects.

## hledger-update

This uses my [hledger-exporter](https://github.com/dat2/hledger-exporter) tool to update a `hledger` journal at midnight every day.

Make sure to [generate an SSH key](), and create the secret:

How to run:

- [Generate an SSH key](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent), create it in the `~/.ssh-k8s` directory
- Create the secret in k8s: `kubectl create secret generic ssh-key --from-file=$HOME/.ssh-k8s/id_rsa --from-file=$HOME/.ssh-k8s/id_rsa.pub`
- Build the docker image: `docker build docker/hledger-update --tag hledger-update`.
- Create the cron job: `kubectl apply -f k8s`
- Create the plaid secret: `kubectl create secret generic plaid-secrets --from-literal=client_id=<PLAID_CLIENT_ID> --from-literal=secret=<PLAID_SECRET>--from-literal=public_key=<PLAID_PUBLIC_KEY> --from-literal=access_token=<PLAID ACCESS TOKEN>`

## hledger-web

This uses `hledger-web` and `hledger-api` to show transactions.
