.PHONY: build proto install

install:
	chmod +x install.sh
	./install.sh
	sudo ufw allow 6969/tcp
	
build:
	docker build -t bitwarp-node:latest -f Dockerfile.node .
	docker build -t bitwarp-tracker:latest -f Dockerfile.tracker .

proto:
	@protoc --go_out=. --go-grpc_out=. proto/**/*.proto