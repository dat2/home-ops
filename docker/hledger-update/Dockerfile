FROM golang:alpine AS build

RUN apk --update --no-cache add git

RUN go get github.com/dat2/hledger-exporter

# main image
FROM alpine

COPY --from=build /go/bin/hledger-exporter /bin/hledger-exporter

# install dependencies
# git / openssh is for updating a git repo
# coreutils is for date -d 'yesterday'
RUN apk --update add --no-cache \
    git \
    openssh \
    bash \
    coreutils

# run as non root user
RUN addgroup -S app && adduser -S app -G app
USER app

WORKDIR /home/app

# setup SSH credentials so we can git clone
RUN mkdir ~/.ssh

# copy start script
COPY --chown=app:app start.sh /bin/start
RUN chmod +x /bin/start

CMD ["/bin/start"]
