DOCKER_REG_PORT ?= 5000
DOCKER_REG ?= localhost:${DOCKER_REG_PORT}

docker_reg:
	docker run -d -p 5000:5000 --name registry --restart=always registry:latest


chatathome: 
	docker build -f Dockerfile -t ${DOCKER_REG}/chatathome .
