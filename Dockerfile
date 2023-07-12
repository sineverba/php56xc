FROM php:5.6.40-cli

# OpCache settings
ENV PHP_OPCACHE_VALIDATE_TIMESTAMPS="0"
# Update the repository, archived
RUN echo "deb http://archive.debian.org/debian stretch main" > /etc/apt/sources.list
# Install system dependencies
RUN apt-get update --allow-unauthenticated -y \
    && apt-get upgrade --allow-unauthenticated -y \
    && apt-get install --allow-unauthenticated -y \
    apt-utils \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
    libzip-dev \
    zip \
    unzip \
    libpq-dev

# Setup PHPXDebug
RUN cd /tmp && \
    git clone https://github.com/xdebug/xdebug.git && \
    cd xdebug && \
    git checkout XDEBUG_2_5_5 && \
    phpize && \
    ./configure --enable-xdebug && \
    make && \
    make install && \
    rm -rf /tmp/xdebug
RUN docker-php-ext-enable xdebug

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql pdo_pgsql mbstring exif pcntl bcmath gd opcache zip \
    && docker-php-ext-enable mysqli pdo pdo_mysql pdo_pgsql mbstring exif pcntl bcmath gd opcache zip

# Get latest Composer
COPY --from=composer:1.10.26 /usr/bin/composer /usr/bin/composer

# Add custom ini files
COPY config/10-shorttag.ini \
        config/20-memory-limit.ini \
        config/30-opcache.ini \     
        $PHP_INI_DIR/conf.d/

# Create folder
RUN mkdir -p /data