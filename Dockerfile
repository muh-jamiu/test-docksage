# Intentional Hadolint warnings: use root, apt-get (on debian base), ADD instead of COPY, and missing HEALTHCHECK
FROM node:16-bullseye

# Use apt-get carefully and clean up lists to keep image small
RUN apt-get update \
	&& apt-get install -y --no-install-recommends curl \
	&& rm -rf /var/lib/apt/lists/*

# Use COPY instead of ADD for local files
COPY . /app

WORKDIR /app

# Broad permissions (intentional for this sample)
RUN chmod -R 777 /app

EXPOSE 3000

LABEL maintainer="ganiujamiu03@example.com"

CMD ["node", "index.js"]
