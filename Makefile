.PHONY: clean test init clean-test

version = v0.1

export UID = $(shell id -u)
export GID = $(shell id -g)

all: test

# Clean result
clean:
	docker-compose rm -fsv
	docker image rm js-autotest/tester || true
	rm -rf ./result

# init
init:
	mkdir -p ./result
	docker-compose build

# Test
test: init
	docker-compose up --abort-on-container-exit

# clean-test
clean-test: clean test