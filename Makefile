IMAGE_NAME=sineverba/testphp56xc
CONTAINER_NAME=testphp56xc


build:
		docker build --tag $(IMAGE_NAME) .

multiple:
		docker buildx build --tag $(IMAGE_NAME) --platform linux/386,linux/amd64,linux/arm/v6,linux/arm/v7 --push .

test:
		@docker run --rm $(IMAGE_NAME) php -v | grep 5.6.40
		@docker run --rm $(IMAGE_NAME) php -v | grep OPcache
		@docker run --rm $(IMAGE_NAME) php -m | grep xdebug
		@docker run --rm $(IMAGE_NAME) php -r "echo phpversion('xdebug');" | grep "2.5.5"
		@docker run --rm $(IMAGE_NAME) php -m | grep pdo_pgsql
		@docker run --rm $(IMAGE_NAME) php -m | grep zip
		@docker run --rm $(IMAGE_NAME) /usr/bin/composer -V | grep "1.10.25"
		@docker run --rm $(IMAGE_NAME) php -i | grep "short_open_tag => Off => Off"
		@docker run --rm $(IMAGE_NAME) php -i | grep "memory_limit => 512M => 512M"

destroy:
		docker image rm $(IMAGE_NAME)