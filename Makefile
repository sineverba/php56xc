build:
		docker build --tag sineverba/testphp56xc .

multiple:
		docker buildx build --tag sineverba/testphp56xc --platform linux/386,linux/amd64,linux/arm/v6,linux/arm/v7 --push .

test:
		@docker run --rm sineverba/testphp56xc php -v | grep 5.6.40
		@docker run --rm sineverba/testphp56xc php -v | grep OPcache
		@docker run --rm sineverba/testphp56xc php -m | grep xdebug
		@docker run --rm sineverba/testphp56xc php -r "echo phpversion('xdebug');" | grep "2.5.5"
		@docker run --rm sineverba/testphp56xc php -m | grep pdo_pgsql
		@docker run --rm sineverba/testphp56xc php -m | grep zip
		@docker run --rm sineverba/testphp56xc /usr/bin/composer -V | grep "1.10.25"
		@docker run --rm sineverba/testphp56xc php -i | grep "short_open_tag => Off => Off"
		@docker run --rm sineverba/testphp56xc php -i | grep "memory_limit => 512M => 512M"

destroy:
		docker image rm sineverba/testphp56xc