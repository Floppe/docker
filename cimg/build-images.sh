#!/usr/bin/env bash
set -eo pipefail

docker build --file base/Dockerfile -t registry.nextlog.fi/cimg/base --platform linux/amd64 --push .
docker build --file android/Dockerfile -t registry.nextlog.fi/cimg/android --platform linux/amd64 --push .
docker build --file ndk/Dockerfile -t registry.nextlog.fi/cimg/android:ndk --platform linux/amd64 --push .
