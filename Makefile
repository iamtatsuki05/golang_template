# Makefile

# Go related variables
GO_CMD=go
GOLINT_CMD=$(GOPATH)/bin/golint
STATICCHECK_CMD=$(GOPATH)/bin/staticcheck
GOIMPORTS_CMD=$(GOPATH)/bin/goimports

# Directories
SRC_DIRS=./src

# Targets
.PHONY: all lint vet staticcheck

all: lint vet staticcheck

all: fmt imports tidy lint vet staticcheck test

fmt:
	@echo "Running go fmt..."
	@$(GO_CMD) fmt $(SRC_DIRS)

imports:
	@echo "Running goimports..."
	@$(GOIMPORTS_CMD) -w $(SRC_DIRS)

tidy:
	@echo "Running go mod tidy..."
	@$(GO_CMD) mod tidy

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
