#!/bin/bash
version=$(sed -n 's/^ *version.*=.*"\([^"]*\)".*/\1/p' pack.toml)
name=$(sed -n 's/^ *name.*=.*"\([^"]*\)".*/\1/p' pack.toml | awk '{print tolower($0)}' | sed "s/'//g" | sed 's/ /-/g')

# Update the version and name fields
jq --arg version "$version" --arg name "$name" '.modpackVersion = $version | .modpackName = $name' ./mods/config/bcc.json >temp.json

# Replace bcc.json with new version
if [ -r temp.json]; then
	mv temp.json ./mods/config/bcc.json
fi
