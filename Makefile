version := $(shell sed -n 's/^ *version.*=.*"\([^"]*\)".*/\1/p' pack.toml)
name := $(shell sed -n 's/^ *name.*=.*"\([^"]*\)".*/\1/p' pack.toml | awk '{print tolower($0)}' | sed "s/'//g" | sed 's/ /-/g')

exportModrinth: setupExportDir
	packwiz modrinth export -o export/$(name)-$(version).mrpack

setupExportDir: clean
	mkdir export

refresh:
	packwiz refresh

clean:
	rm -rf export
