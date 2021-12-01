TAG = "rancher_child_elixir:latest"

# this doesn't work.. because buildkit isn't running/ssh agent stuff isn't working
# docker is already aliased to nerdctl
build:
	docker build --progress plain --ssh default=${SSH_AUTH_SOCK} -t ${TAG} .

# this does work but only after editing 
# /Users/b/Library/Application\ Support/rancher-desktop/lima/0/lima.yaml
# and adding ssh.forwardAgent option 
# https://github.com/lima-vm/lima/blob/77078697afd87a1c3a477a05e96571b9b3c62aff/pkg/limayaml/default.yaml
build-kim:
	kim build --progress plain --ssh default=/private/tmp/com.apple.launchd.LGxrLAiePC/Listeners -t ${TAG} .
