package project

import (
	"app/src/project"
	"testing"

	"github.com/stretchr/testify/assert"
)

func TestVersion(t *testing.T) {
	assert.Equal(t, "0.0.1", project.Version)
}
