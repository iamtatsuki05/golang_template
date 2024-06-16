# Makefile

# Go related variables
GO_CMD=go
GOLINT_CMD=$(GOPATH)/bin/golint
STATICCHECK_CMD=$(GOPATH)/bin/staticcheck

# Directories
SRC_DIRS=./src

# Targets
.PHONY: all lint vet staticcheck

all: lint vet staticcheck

lint:
	@echo "Running golint..."
	@$(GOLINT_CMD) -set_exit_status $(SRC_DIRS)

vet:
	@echo "Running go vet..."
	@$(GO_CMD) vet ./src

staticcheck:
	@echo "Running staticcheck..."
	@$(STATICCHECK_CMD) $(SRC_DIRS)

test:
	@echo "Running go test..."
	@$(GO_CMD) test -v ./src
