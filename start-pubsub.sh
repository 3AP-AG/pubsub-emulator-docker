#!/usr/bin/env bash

# Check user environment variable
if [[ -z "${PUBSUB_PROJECT_ID}" ]]; then
  echo "Missing PUBSUB_PROJECT_ID environment variable" >&2
  exit 1
fi

if [[ -z "${PUBSUB_LISTEN_ADDRESS}" ]]; then
  echo "Missing PUBSUB_LISTEN_ADDRESS environment variable" >&2
  exit 1
fi

# Start emulator
gcloud beta emulators pubsub start \
  --project=${PUBSUB_PROJECT_ID} \
  --host-port=${PUBSUB_LISTEN_ADDRESS}
