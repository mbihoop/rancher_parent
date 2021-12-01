TAG = "rancher_child_elixir:latest"

# this doesn't work.. 
# this still does not work after editing 
# /Users/b/Library/Application\ Support/rancher-desktop/lima/0/lima.yaml
# and adding ssh.forwardAgent option because buildkit isn't running/ssh agent stuff isn't working
# docker is already aliased to nerdctl
build:
	docker build --progress plain --ssh default=${SSH_AUTH_SOCK} -t ${TAG} .

# this just works, regardless of whether or not I edit 
# /Users/b/Library/Application\ Support/rancher-desktop/lima/0/lima.yaml
# and add ssh.forwardAgent option
build-kim:
	kim build --progress plain --ssh default=/private/tmp/com.apple.launchd.LGxrLAiePC/Listeners -t ${TAG} .
