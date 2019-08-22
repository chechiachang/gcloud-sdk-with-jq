FROM gcr.io/cloud-builders/gcloud-slim@sha256:d4ca671e5764c0f8f494a2a7540ced1753fbbe62af249e74c2fc0bbac6fa94fc

LABEL "name"="gcloud-with-jq"
LABEL "version"="1.0.0"
LABEL "maintainer"="David Chang <chechiachang999@gmail.com>"

ENV DOCKERVERSION=18.06.1-ce
RUN apt-get update && apt-get -y --no-install-recommends install curl jq \
  	&& curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-${DOCKERVERSION}.tgz \
  	&& tar xzvf docker-${DOCKERVERSION}.tgz --strip 1 \
   		-C /usr/local/bin docker/docker \
	&& rm docker-${DOCKERVERSION}.tgz \
	&& rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
