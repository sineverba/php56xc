php56xc: Docker image for PHP5.6.x + Xdebug + Composer
======================================================

`docker pull sineverba/php56xc:latest`


| CD / CI   |           |
| --------- | --------- |
| Semaphore CI | [![Build Status](https://sineverba.semaphoreci.com/badges/php56xc/branches/master.svg)](https://sineverba.semaphoreci.com/projects/php56xc) |
| Circle CI | [![CircleCI](https://circleci.com/gh/sineverba/php56xc.svg?style=svg)](https://circleci.com/gh/sineverba/php56xc) |


Docker image built from **PHP5.6.x** CLI official + **X**debug + **C**omposer, multiarchitectures.

Short tags are __OFF__.

Image ready to use as alias for development.

Do you use it? **Star it!**


## Versions

| Github / Docker Image tag | PHP Version | Composer version | XDebug | Multiple Architectures ? |
| ------------------------- | ----------- | ---------------- | ------ | ------------------------ |
| latest | 5.6.40 | 1.10.22 | 2.5.5 | linux/386,linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.2.0 | 5.6.40 | 1.10.21 | 2.5.5 | linux/386,linux/amd64,linux/arm/v6,linux/arm/v7 |
| 1.1.0 | 5.6.40 | 1.10.20 | 2.5.5 | linux/386,linux/amd64,linux/arm/v6,linux/arm/v7 |


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

`$ docker pull sineverba/php56xc:latest`


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
$ alias php56='docker run -it -w /data -v ${PWD}:/data --entrypoint php --rm sineverba/php56xc:latest'
$ alias composer56='docker run -it -w /data -v ${PWD}:/data --entrypoint "/usr/bin/composer" --rm sineverba/php56xc:latest'
```

### Issues with memory limit (on composer)

`$ php -d memory_limit=-1 /usr/bin/composer require [...]`

#### Build and test image locally

```shell
$ make build
$ make test
$ make destroy
```

+ Check images list

`$ docker image ls`

+ Clone the project

`$ git clone git@github.com:sineverba/php56xc.git`

+ Run from same folder

`$ docker build --tag php56xc:x.y.z .`

+ Check new image (php56xc:x.y.z)

`$ docker image ls`