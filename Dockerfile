# Intentional Hadolint warnings: use root, apt-get (on debian base), ADD instead of COPY, and missing HEALTHCHECK
FROM node:16

# Use of apt-get in node base will cause warnings (DL3013, etc.)
RUN apt-get update && apt-get install -y curl 

# Using ADD instead of COPY (bad practice)
ADD . /app

WORKDIR /app

# Broad permissions
RUN chmod -R 777 /app

EXPOSE 3000

LABEL maintainer="you@example.com"

CMD ["node", "index.js"]

