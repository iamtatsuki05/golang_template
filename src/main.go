package main;

import (
    "fmt"
    "app/src/project"
)

func main() {
    fmt.Println("Version: ", project.Version)
    fmt.Println("Package Dir: ", project.PACKAGE_DIR)
}
