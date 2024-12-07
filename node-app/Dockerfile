FROM node:alpine

# Set working directory
WORKDIR /usr/src/app

COPY package*.json .

RUN npm ci

# Copy application code
COPY index.js .

# Copy the self-signed certificate for trusted CA
# COPY ../certs/self-signed.crt /usr/local/share/ca-certificates/self-signed.crt

# Install certificate
# RUN update-ca-certificates

# Set NODE_EXTRA_CA_CERTS to point to the certificate
ENV NODE_EXTRA_CA_CERTS=/usr/local/share/ca-certificates/self-signed.crt

# Command to run the app
CMD ["node", "index.js"]