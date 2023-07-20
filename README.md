# readysetwait
Minimal Docker image to wait for other docker containers (or potentially other conditions).

Docker-compose's `depends_on` functionality is limited, and only works for other containers within the same file.  I have a separate stack for some shared dependencies (like a database and MQTT broker) that I want to make sure is up and healthy before deploying subsequent stacks.

First target script will be [https://github.com/jordyv/wait-for-healthy-container](wait-for-healthy-container), but I may add more or modify that one if needed.

### Example usage
```
version: "3.9"
services:
  rsw:
      image: ghcr.io/sammy1am/readysetwait:main
      network_mode: none
      volumes:
        - /var/run/docker.sock:/var/run/docker.sock
      command: backend-MariaDB-1 180
  needy-service:
    depends_on:
      rsw:
        condition: service_completed_successfully
        restart: true
```

The `rsw` service will only exist successfully if the container named `backend-MariaDB-1` is healthy within 180 seconds.  If it exits successfully, then `needy-service` will start.
