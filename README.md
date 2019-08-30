# Bookworm

REST and GraphQL API for Bookworm apps

## Docker builds
`docker build --build-arg APP_NAME=$APP_NAME --build-arg APP_VSN=$APP_VSN -t "api:$APP_VSN" .`

## Release tasks
```
bin/bookworm eval "Bookworm.ReleaseTasks.migrate"
bin/bookworm eval "Bookworm.ReleaseTasks.seed"
```
