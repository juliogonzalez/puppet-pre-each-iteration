#!/bin/bash
ESCPWD=$(echo ${PWD}| sed -e "s/\//\\\\\//g")
sed -i -e "s/:datadir:.*/:datadir: $ESCPWD\/hieradata/" hiera.yaml
$(which ruby) $(which puppet) apply manifests/init.pp --hiera_config hiera.yaml
