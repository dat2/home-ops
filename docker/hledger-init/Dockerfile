FROM alpine

# git is required to clone
RUN apk --update add --no-cache \
    git \
    openssh \
    bash

# run as non root user
RUN addgroup -S app && adduser -S app -G app
USER app

# run in the home directory
WORKDIR /home/app

RUN mkdir ~/.ssh

COPY --chown=app:app start.sh /bin/start
RUN chmod +x /bin/start

CMD ["/bin/start"]
