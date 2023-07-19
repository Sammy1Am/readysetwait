FROM alpine

## Add wait-for-healthy-container.sh
ADD https://raw.githubusercontent.com/jordyv/wait-for-healthy-container/master/wait-for-healthy-container.sh /opt/wait-for-healthy-container.sh
RUN chmod +x /opt/wait-for-healthy-container.sh

## Launch the wait tool
ENTRYPOINT /opt/wait-for-healthy-container.sh
