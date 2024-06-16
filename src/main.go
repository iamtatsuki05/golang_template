package main

import (
	"app/src/project"
	"fmt"
)

func main() {
	fmt.Println("Version: ", project.Version)
	fmt.Println("Package Dir: ", project.PACKAGE_DIR)
}
