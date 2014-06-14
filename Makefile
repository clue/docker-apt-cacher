# Quick development routine: 
#    make build clean run && sleep 1 && make logs
#

IMAGE_NAME = clue/apt-cacher
CONTAINER_NAME = apt-cacher
PORT ?= 3142

build:
	docker build --rm -t $(IMAGE_NAME) .
	
run:
	@echo [TIP] change the port with: make run PORT=1234
	@echo Stating $(CONTAINER_NAME) on port $(PORT)...
	docker run --detach --publish $(PORT):3142 --name $(CONTAINER_NAME) $(IMAGE_NAME)

clean:
	@docker kill $(CONTAINER_NAME) &>/dev/null &&\
	docker rm $(CONTAINER_NAME) &>/dev/null &&\
	echo "$(CONTAINER_NAME) removed" ||\
	echo "$(CONTAINER_NAME) is not running"

logs:
	docker logs $(CONTAINER_NAME)
	
shell:
	docker run --rm --tty --interactive $(IMAGE_NAME) bash -i

