# Bookworm

(https://codecov.io/gh/hansjhoffman/bookworm-api/branch/master/graph/badge.svg?token=)](https://codecov.io/gh/hansjhoffman/bookworm-api)

REST and GraphQL API for Bookworm apps

## Docker builds
`docker build --build-arg APP_NAME=$APP_NAME --build-arg APP_VSN=$APP_VSN -t "api:$APP_VSN" .`

## Release tasks
```
bin/bookworm eval "Bookworm.ReleaseTasks.migrate"
bin/bookworm eval "Bookworm.ReleaseTasks.seed"
```
