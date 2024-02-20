version := $(shell sed -n 's/^ *version.*=.*"\([^"]*\)".*/\1/p' pack.toml)
name := $(shell sed -n 's/^ *name.*=.*"\([^"]*\)".*/\1/p' pack.toml | awk '{print tolower($0)}' | sed "s/'//g" | sed 's/ /-/g')

export: clean refresh exportCurseForge exportModrinth

exportModrinth: setupExportDir
	packwiz modrinth export -o export/$(name)-$(version).mrpack

exportCurseForge: setupExportDir
	packwiz curseforge export -o export/$(name)-$(version).zip

setupExportDir:
	mkdir -p export

refresh:
	packwiz refresh

clean:
	rm -rf export
