# Google Cloud Pub/Sub Emulator

A [Google Cloud Pub/Sub Emulator](https://cloud.google.com/pubsub/docs/emulator) container image.
The image is meant to be used for creating a standalone emulator for testing.

## Tags

The release tags are based on [google/cloud-sdk](https://cloud.google.com/sdk/docs/release-notes)
version

## Environment

The following environment variables must be set:

- `PUBSUB_LISTEN_ADDRESS`: The address should refer to a listen address, meaning that `0.0.0.0` can
  be used. The address must use the syntax `HOST:PORT`, for example `0.0.0.0:8432`. The container
  must expose the port used by the Pub/Sub emulator.
- `PUBSUB_PROJECT_ID`: The ID of the Google Cloud project for the emulator.

## Run Docker image

```commandline
docker run -e PUBSUB_PROJECT_ID=project-test -e PUBSUB_LISTEN_ADDRESS=0.0.0.0:8432 -p 8432:8432 3apag/pubsub-emulator:latest
```

## Creating a Pub/Sub emulator with Docker Compose

The easiest way to create an emulator with this image is by
using [Docker Compose](https://docs.docker.com/compose). The following snippet can be used as
a `docker-compose.yml` for a Pub/Sub emulator:

```YAML
version: '3'

volumes:
  pubsub_data:
    driver: local

services:
  pubsub:
    image: 3apag/pubsub-emulator
    environment:
      - PUBSUB_PROJECT_ID=project-test
      - PUBSUB_LISTEN_ADDRESS=0.0.0.0:8432
    ports:
      - 8432:8432
    volumes:
      - pubsub_data:/opt/data
```

### Persistence

The image has a volume mounted at `/opt/data`. To maintain states between restarts, mount a volume
at this location.
