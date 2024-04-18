#!/bin/bash
docker run --rm --mount type=bind,source=./gamefiles,target=/mnt/gamefiles -it balatrobuilder:latest