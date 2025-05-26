NAME = debian:latest

build:
	docker buildx build --platform linux/arm64 -t $(NAME) .

run:
	docker run -it debian:latest

rm:
	docker rmi $(NAME)
