SKIP_SQUASH?=0
VERSIONS="2.0 2.2"

ifeq ($(TARGET),rhel7)
	OS := rhel7
else
	OS := centos7
endif

ifeq ($(VERSION), 2.0)
	VERSION := 2.0
else ifeq ($(VERSION), 2.2)
	VERSION := 2.2
else
	VERSION :=
endif

.PHONY: build
build:
	SKIP_SQUASH=$(SKIP_SQUASH) VERSIONS=$(VERSIONS) hack/build.sh $(OS) $(VERSION)

.PHONY: test
test:
	SKIP_SQUASH=$(SKIP_SQUASH) VERSIONS=$(VERSIONS) TAG_ON_SUCCESS=$(TAG_ON_SUCCESS) TEST_MODE=true hack/build.sh $(OS) $(VERSION)
