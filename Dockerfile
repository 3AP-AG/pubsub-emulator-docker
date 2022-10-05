# Use google cloud sdk
FROM google/cloud-sdk:405.0.0-alpine

MAINTAINER florian-3ap

# Install Java 8 for Pub/Sub emulator
RUN apk --update add openjdk8-jre
RUN gcloud components install pubsub-emulator beta --quiet

# Volume to persist Pub/Sub data
VOLUME /opt/data

COPY start-pubsub.sh .
RUN ["chmod", "+x", "./start-pubsub.sh"]

EXPOSE 8432

ENTRYPOINT ["./start-pubsub.sh"]