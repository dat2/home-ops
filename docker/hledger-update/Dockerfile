FROM golang:stretch AS build

# we need git so that we can go get
RUN apt-get update && apt-get install -y --no-install-recommends \
        git

RUN go get github.com/dat2/hledger-exporter

# main image
FROM debian:stretch

# use the binary that we just built above
COPY --from=build /go/bin/hledger-exporter /bin/hledger-exporter

# install dependencies
# git / openssh is for updating a git repo
# coreutils is for date -d 'yesterday'
RUN apt-get update && apt-get install -y --no-install-recommends \
        git \
        openssh-client \
        coreutils \
        hledger \
    && rm -rf /var/lib/apt/lists/*

# run as non root user
RUN groupadd app
RUN useradd --create-home -g app app
USER app

# run in the home directory
WORKDIR /home/app

# setup SSH credentials so we can git clone
RUN mkdir ~/.ssh

# copy start script
COPY --chown=app:app start.sh /bin/start
RUN chmod +x /bin/start

CMD ["/bin/start"]
