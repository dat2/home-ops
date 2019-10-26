# home-ops

This is my repo of personal projects.

## hledger-update

This uses [plaid](https://plaid.com/) to automatically update an [hledger](https://hledger.org/) journal nightly.

Make sure to [generate an SSH key](), and create the secret:

How to run:

- [Generate an SSH key](https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent), create it in the `~/.ssh-k8s` directory
- Create the secret in k8s: `kubectl create secret generic ssh-key --from-file=$HOME/.ssh-k8s/id_rsa --from-file=$HOME/.ssh-k8s/id_rsa.pub`
- Build the docker image: `docker build docker/hledger-update --tag hledger-update`.
- Create the cron job: `kubectl apply -f k8s`
