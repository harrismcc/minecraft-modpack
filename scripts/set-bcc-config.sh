#!/bin/bash
version=$(sed -n 's/^ *version.*=.*"\([^"]*\)".*/\1/p' pack.toml)
name=$(sed -n 's/^ *name.*=.*"\([^"]*\)".*/\1/p' pack.toml | awk '{print tolower($0)}' | sed "s/'//g" | sed 's/ /-/g')

# Update the version and name fields
updated=$(jq --arg version "$version" --arg name "$name" '.modpackVersion = $version | .modpackName = $name' ./config/bcc.json)

echo $updated >./config/bcc.json
