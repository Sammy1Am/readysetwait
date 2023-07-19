# readysetwait
Minimal Docker image to wait for other docker containers (or potentially other conditions).

Docker-compose's `depends_on` functionality is limited, and only works for other containers within the same file.  I have a separate stack for some shared dependencies (like a database and MQTT broker) that I want to make sure is up and healthy before deploying subsequent stacks.

First target script will be [https://github.com/jordyv/wait-for-healthy-container](wait-for-healthy-container), but I may add more or modify that one if needed.
