#!/bin/bash

declare -r module_dir="/usr/lib/dracut/modules.d/01pinguin"

mkdir "$module_dir"
mv /vagrant/dracut/module-setup.sh "$module_dir"
mv /vagrant/dracut/print-pinguin.sh "$module_dir"

dracut -fv
