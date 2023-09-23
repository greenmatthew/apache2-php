FROM php:apache-bullseye

ENV UID=568
ENV GID=568
ENV DIRECTORY_INDEXING=true

# Update UID and GID for www-data
RUN usermod -u $UID www-data && \
    groupmod -g $GID www-data && \
    chown www-data:www-data -R /var/www/html/

# Copy the startup script into the container and make sure the script is executable
COPY start.sh /usr/local/bin
RUN chmod +x /usr/local/bin/start.sh

# Set the startup script as the entry point
ENTRYPOINT ["start.sh"]
