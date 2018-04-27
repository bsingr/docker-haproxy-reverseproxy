default: build push

build:
	docker build . -t bsingr/docker-haproxy-reverseproxy

push:
	docker push bsingr/docker-haproxy-reverseproxy