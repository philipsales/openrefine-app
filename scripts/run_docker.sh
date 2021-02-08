#!/bin/bash
cd "$(dirname "$0")"

docker run --restart=always --net host -p 8080:3333 -v ${PWD}/openrefine-data:/data -it asia.gcr.io/dev-medchek-pipeline/openrefine_app:3.0