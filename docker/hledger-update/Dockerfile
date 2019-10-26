FROM alpine

# install dependencies
RUN apk --update add --no-cache \
    git \
    openssh \
    bash

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
