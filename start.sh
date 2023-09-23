#!/bin/bash

# Check if directory indexing is enabled
if [ "$DIRECTORY_INDEXING" = "true" ]; then
    echo "Enabling directory indexing..."
    echo '<Directory /var/www/html>' >> /etc/apache2/apache2.conf
    echo '    Options +Indexes' >> /etc/apache2/apache2.conf
    echo '</Directory>' >> /etc/apache2/apache2.conf
fi

# Start Apache in the foreground
exec apache2-foreground
