#
# Step 1 - Build the OTP binary
#
ARG ALPINE_VERSION=3.9

FROM elixir:1.9-alpine AS builder

ARG APP_NAME
ARG APP_VSN
ARG MIX_ENV=prod

ENV APP_NAME=${APP_NAME} \
    APP_VSN=${APP_VSN} \
    MIX_ENV=${MIX_ENV}

WORKDIR /opt/builder

# This step installs all the build tools we'll need
RUN apk update && \
    apk upgrade --no-cache && \
    apk add --no-cache git build-base && \
RUN mix local.rebar --force && \
    mix local.hex --if-missing --force

COPY . .

RUN mix do \
    deps.get --only ${MIX_ENV}, \
    deps.compile --force, \
    release

#
# Step 2 - build a lean runtime container
#
FROM alpine:${ALPINE_VERSION}

ARG APP_NAME

RUN apk update && \
    apk add --no-cache bash openssl-dev erlang-crypto

WORKDIR /opt/${APP_NAME}

# Copy the OTP binary from the build step
COPY --from=builder /opt/builder/_build/${MIX_ENV}/rel/${APP_NAME} .

# Copy the entrypoint script
COPY priv/scripts/docker-entrypoint.sh /usr/local/bin
RUN chmod a+x /usr/local/bin/docker-entrypoint.sh

# Create a non-root user
RUN adduser -D bookworm && \
    chown -R bookworm: /opt/bookworm
USER bookworm

ENTRYPOINT ["docker-entrypoint.sh"]
CMD ["start"]
