package project

import (
	"path/filepath"
	"runtime"
)

const (
	Version string = "0.0.1"
)

var PACKAGE_DIR string

func init() {
	_, filename, _, _ := runtime.Caller(0)
	PACKAGE_DIR = filepath.Dir(filepath.Dir(filepath.Dir(filename)))
}
