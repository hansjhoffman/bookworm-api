#!/bin/sh
set -e

# Run the migration first using the custom release task
/opt/$APP_NAME/bin/$APP_NAME eval "Bookworm.ReleaseTasks.migrate"
/opt/$APP_NAME/bin/$APP_NAME eval "Bookworm.ReleaseTasks.seed"

# Launch the OTP release and replace the caller as Process #1 in the container
exec /opt/$APP_NAME/bin/$APP_NAME "$@"
