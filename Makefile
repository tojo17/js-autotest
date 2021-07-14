.PHONY: clean test

version = v0.1

all: test

# Clean result
clean:
	docker image rm js-autotest/tester
	rm -rf ./result

# Test
test: clean
	docker-compose up --build --abort-on-container-exit && docker-compose rm -fsv
	cat ./result/test.txt