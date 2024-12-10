# docker/srv1/Dockerfile
FROM itzg/minecraft-server

# Define environment variables
ENV EULA=TRUE
ENV VERSION=1.20.4
ENV TYPE=PAPER
ENV ONLINE_MODE=FALSE
ENV CREATE_CONSOLE_IN_PIPE=true
ENV PLUGINS_FILE=/config/plugins/plugins.txt

# Copy configuration files from the common directory
COPY common/game_server-files/plugins/plugins.txt /config/plugins/plugins.txt
COPY common/game_server-files/paper-global.yml /config/paper-global.yml
COPY common/game_server-files/db_config/luckperms_config.yml /data/plugins/LuckPerms/config.yml
COPY common/game_server-files/db_config/plan_config.yml /data/plugins/Plan/config.yml
COPY common/game_server-files/db_config/sql.yml /data/plugins/LibertyBans/sql.yml
COPY common/game_server-files/db_config/sql.conf /data/plugins/BlueMap/storages/sql.conf
COPY compiled_code/paper /data/plugins

# Set volume mount point
VOLUME /data

RUN chown -R 1000:1000 /data && \
    chmod -R 755 /data

# Default command to start the Minecraft server
CMD ["start"]