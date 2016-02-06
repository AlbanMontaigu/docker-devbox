#!/bin/bash

# =======================================================================
#
# Features to help testing with bats
#
# @see https://github.com/sstephenson/bats
# @see https://blog.engineyard.com/2014/bats-test-command-line-tools
#
# =======================================================================


# Allows to exec a command inside the container
dk_devbox_cmd() {
    if [ $# -eq 1 ]; then
        docker run --rm \
            -v /var/run/docker.sock:/var/run/docker.sock \
            -v /app/tests/:/workspace \
            -w="/workspace" \
            ${DOCKER_IMAGE_NAME} -c "$1"
    else
        echo "Usage: dk_devbox_cmd COMMAND"
    fi
}
