package main

import (
	core "github.com/sethvargo/go-githubactions"
)

func main() {
	val := core.GetInput("mode")
	if val == "" {
		core.Fatalf("missing 'mode'")
	}

	core.Infof(val)

}
