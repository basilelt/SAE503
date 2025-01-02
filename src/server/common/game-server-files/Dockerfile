# docker/game-server/Dockerfile
FROM itzg/minecraft-server

# Define environment variables
ENV EULA=TRUE
ENV VERSION=1.20.4
ENV TYPE=PAPER
ENV ONLINE_MODE=FALSE
ENV CREATE_CONSOLE_IN_PIPE=true
ENV PLUGINS_FILE=/config/plugins/plugins.txt

# Copy configuration files from the common directory
COPY server/common/game-server-files/plugins/plugins.txt /config/plugins/plugins.txt
COPY server/common/game-server-files/paper-global.yml /config/paper-global.yml

# Set volume mount point
VOLUME /data

RUN chown -R 1000:1000 /data && \
    chmod -R 755 /data

# Default command to start the Minecraft server
CMD ["start"]