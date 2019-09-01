# Bookworm

[![codecov](https://codecov.io/gh/hansjhoffman/bookworm-api/branch/master/graph/badge.svg?token=5KvLCxDAN5)](https://codecov.io/gh/hansjhoffman/bookworm-api)

REST and GraphQL API for Bookworm apps

## Docker builds
`docker build --build-arg APP_NAME=$APP_NAME --build-arg APP_VSN=$APP_VSN -t "api:$APP_VSN" .`

docker-compile build --pull
docker run SECRET_KEY_BASE=`mix phx.gen.secret` bookworm:1.0.0

## Release tasks
```
bin/bookworm eval "Bookworm.ReleaseTasks.migrate"
bin/bookworm eval "Bookworm.ReleaseTasks.seed"
```
