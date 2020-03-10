#!/usr/bin/env bash

# STEP-01:
# ESTABLISH DOCKER PATH
dockerpath=/rradi/udacity_devops_capstone_project

# STEP-02:
# AUTHENTICATE DOCKER IMAGE
echo "Docker ID and Image: $dockerpath"
docker login --username rradi
# TAG DOCKER IMAGE
docker tag blueImage $dockerpath

# STEP-03:
# PUSH DOCKER IMAGE
docker push $dockerpath
