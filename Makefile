DOCKER_REG_PORT ?= 5000
DOCKER_REG ?= localhost:${DOCKER_REG_PORT}

docker_reg:
	docker run -d -p ${DOCKER_REG_PORT}:${DOCKER_REG_PORT} --name registry registry:latest

chatathome: 
	docker build -f Dockerfile -t ${DOCKER_REG}/chatathome .