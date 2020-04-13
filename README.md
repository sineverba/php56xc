php56xc: Docker image for PHP5.6 + Xdebug + Composer
====================================================

Docker image built from **PHP5.6** CLI official + **X**debug + **C**omposer.

Image ready to use as alias for development.

Do you use it? **Star it!**

## Add image as alias

``` bash

$ cd ~
$ nano .bashrc
$ alias php56='docker run -it -w /data -v ${PWD}:/data --entrypoint php --rm sineverba/php56xc:latest'
$ alias composer56='docker run -it -w /data -v ${PWD}:/data --entrypoint "/usr/bin/composer" --rm sineverba/php56xc:latest'

```

### Build and test image locally

+ Check images list

`$ docker image ls`

+ Clone the project

`$ git clone git@github.com:sineverba/php56xc.git`

+ Run from same folder

`$ docker build --tag php56xc:x.y.z .`

+ Check new image (php56xc:x.y.z)

`$ docker image ls`