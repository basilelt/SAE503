# docker/proxy/Dockerfile
FROM itzg/mc-proxy

# Define environment variables
ENV TYPE=VELOCITY
ENV VELOCITY_VERSION=3.3.0-SNAPSHOT
ENV VELOCITY_BUILD_ID=436
ENV VERSION=1.20.4
ENV DEBUG=false
ENV ENABLE_RCON=true
ENV PLUGINS_FILE=/config/plugins/plugins.txt

# Copy configuration files from the common directory
COPY server/common/proxy-files/velocity.toml /config/velocity.toml
COPY server/common/proxy-files/forwarding.secret /config/forwarding.secret
COPY server/common/proxy-files/plugins/plugins.txt /config/plugins/plugins.txt

# Set permissions
RUN chown -R 1000:1000 /config && \
    chmod -R 777 /config

# Define the mount point for volumes
VOLUME /server

# Expose the port
EXPOSE 25577