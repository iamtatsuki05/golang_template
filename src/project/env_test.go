package project

import (
	"testing"
	"github.com/stretchr/testify/assert"
	"app/src/project"
)

func TestVersion(t *testing.T) {
	assert.Equal(t, "0.0.1", project.Version)
}
