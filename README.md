php56xc: Docker image for PHP5.6.x + Xdebug + Composer
======================================================

> Docker image built from **PHP5.6.x** CLI official + **X**debug + **C**omposer, multiarchitectures.


| CD / CI   |           |
| --------- | --------- |
| Semaphore CI | [![Build Status](https://sineverba.semaphoreci.com/badges/php56xc/branches/master.svg)](https://sineverba.semaphoreci.com/projects/php56xc) |
| Circle CI | [![CircleCI](https://circleci.com/gh/sineverba/php56xc.svg?style=svg)](https://circleci.com/gh/sineverba/php56xc) |
| Docker Hub | `docker pull sineverba/php56xc:1.8.0` - [Link to image](https://hub.docker.com/r/sineverba/php56xc) |


Short tags are __OFF__.

Image ready to use as alias for development.

Do you use it? **Star it!**


## Versions

| Github / Docker Image tag | PHP Version | Composer version | XDebug | Multiple Architectures ? |
| ------------------------- | ----------- | ---------------- | ------ | ------------------------ |
| latest | 5.6.40 | 1.10.27 | 2.5.5 | linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.8.0 | 5.6.40 | 1.10.27 | 2.5.5 | linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.7.0 | 5.6.40 | 1.10.27 | 2.5.5 | linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.6.0 | 5.6.40 | 1.10.26 | 2.5.5 | linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.5.0 | 5.6.40 | 1.10.26 | 2.5.5 | linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.4.0 | 5.6.40 | 1.10.25 | 2.5.5 | linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.3.0 | 5.6.40 | 1.10.22 | 2.5.5 | linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.2.0 | 5.6.40 | 1.10.21 | 2.5.5 | linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.1.0 | 5.6.40 | 1.10.20 | 2.5.5 | linux/amd64,linux/arm/v6,linux/arm/v7 |


## OpCache and settings

During development, you can enable/disable `opcache_validate_timestamps` with

```yaml
# docker-compose.yml
services:
  app:
    environment:
      PHP_OPCACHE_VALIDATE_TIMESTAMPS: 1
```

### Update local image

`$ docker pull sineverba/php56xc:1.8.0`


### PHP modules

`$ docker run --rm sineverba/php56xc php -m`

```shell
[PHP Modules]
bcmath
Core
ctype
curl
date
dom
ereg
exif
fileinfo
filter
ftp
gd
hash
iconv
json
libxml
mbstring
mhash
mysqli
mysqlnd
openssl
pcntl
pcre
PDO
pdo_mysql
pdo_pgsql
pdo_sqlite
Phar
posix
readline
Reflection
session
SimpleXML
SPL
sqlite3
standard
tokenizer
xdebug
xml
xmlreader
xmlwriter
Zend OPcache
zip
zlib

[Zend Modules]
Xdebug
Zend OPcache
```

### Add image as alias

``` bash
$ cd ~
$ nano .bashrc
$ alias php56='docker run -it -w /data -v ${PWD}:/data --entrypoint php --rm sineverba/php56xc:1.8.0'
$ alias composer56='docker run -it -w /data -v ${PWD}:/data --entrypoint "/usr/bin/composer" --rm sineverba/php56xc:1.8.0'
```

### Issues with memory limit (on composer)

`$ php -d memory_limit=-1 /usr/bin/composer require [...]`