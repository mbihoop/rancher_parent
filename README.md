# RancherParent

For building using ssh-agent I needed to create the following script to switch between using docker
and kim.

This is fine for me, but when using rancher desktop, it's an extra bit of complexity which impedes adoption.

# Workaround for two different commands to build containers

```
#!/bin/bash

# use nerdctl for all docker commands except build, for build, we need to use kim (which uses buildkit)

if [[ $# > 0 ]]; 
then 
	if [[ $1 == "build" ]];
	then 
	shift 
	exec kim build $@ 
else 
	exec nerdctl $@ ;
	fi
fi 
```
