package main

import (
	core "github.com/sethvargo/go-githubactions"
)

const (
	varName = "mode"
)

func main() {

	s := core.New().GetInput(varName)
	if s != "" {
		core.Infof(s)
	} else {
		core.Infof("\"%s\" var not set", varName)
	}

}
