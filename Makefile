.PHONY: clean test init clean-test

version = v0.1

export UID = $(shell id -u)
export GID = $(shell id -g)
$(info Running as UID=$(UID), GID=$(GID))

ifeq ($(UID), 0)
  export UID = $(SUDO_UID)
  export GID = $(SUDO_GID)
  ifndef UID
    $(error You cannot run this script while logged as root)
  endif
endif
$(info Running by UID=$(UID), GID=$(GID))

all: test

# Clean result
clean:
	docker-compose rm -fsv
	docker image rm js-autotest/tester || true
	rm -rf ./result

# init
init:
	mkdir -p ./result
	chown -R $(UID):$(GID) ./result
	docker-compose build

# Test
test: init
	docker-compose up --abort-on-container-exit

# clean-test
clean-test: clean test