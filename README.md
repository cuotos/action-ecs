# Golang action

trying to create a Go based action which is somewhat efficient.

If this was just a "docker" action, when a pipeline uses it, it will clone this repo and run a Docker build, this takes time as the Go binary has to be compiled every time.

Using a simple JS shim, this can be a "node" action, which in turn runs a pre-build go executable in this repo.
But I dont really want to be committing binaries into the repo, as they are bloat.

one option is to use this repo to build a docker image and push it somewhere public, then in the action.yml file reference that pre-build docker image.
None of the code in this repo actually gets used, the action is cloned, action.yml read, and the docker image referenced in there used.
But im not sure how to manage versions that way.

Another option is to build binaries on tagging this repo, and using github Release to store them.

Then the shim in here will just need to work out which version to use, hopefully it could be "get the latest" or use a "with.version: " arg on the action etc.


I'm leaning to the gihub release option as it keeps it all in one place.