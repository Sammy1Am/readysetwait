ARG DOCKER_VER=stable
FROM docker:${DOCKER_VER}

## Add wait-for-healthy-container.sh
ADD https://raw.githubusercontent.com/jordyv/wait-for-healthy-container/master/wait-for-healthy-container.sh /opt/wait-for-healthy-container.sh
RUN chmod +x /opt/wait-for-healthy-container.sh

## Launch the wait tool
ENTRYPOINT /bin/sh /opt/wait-for-healthy-container.sh
