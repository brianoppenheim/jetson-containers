#!/usr/bin/env bash


BASE_IMAGE="l4t-ml:r32.4.3-py3"

#Brian's test version. l4t-ml is the most up-to-date image as prepared by dusty-nv. This
#attempts to add on simple pieces of setup to the jetson, like creating /home/paradiso
#and cloning startup repositories to ensure that we can add onto existing images.
sh ./scripts/docker_build.sh jetson_dev_env:r0.1.0-py3 Dockerfile.jetson_setup \
			--build-arg BASE_IMAGE=$BASE_IMAGE \
