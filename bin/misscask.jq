# Use:	brew info --cask --eval-all --json=v2 > ~/casks-all.json && \
#		ls /Applications/*.app|gojq -c --slurpfile casks ~/casks-all.json \
#		-nR -f ~/bin/misscask.jq
# Note: some bug prevents the original jq from working, use gojq

reduce $casks[].casks[] as $r({}; #process casks array in the brew info json
	([$r.artifacts[].app?[]?] #primary field for .app file names
	+ [$r.artifacts[].app?[]?.target?] #secondary field when brew renames on install
	+ [$r.artifacts[].uninstall?[]?.delete?[]?] #other field when installed with pkg
	|map(strings #filter out array values because of app.target
	|split("/")|.[-1] #filter out the path, just take basename
	|select(endswith(".app")) #focus on .app bundles for now
	)) as $files #save file names into a named array variable
	| . * { ($files[]):{($r.full_token):$r.installed} } #index by filenames
#^^ save full cask name in an object to preserve multiple casks per filename (e.g. zoom)
#and allow recursive merge (doesn't work for array values)
) #reduce complete, . contains filename-cask index with brew installation status (version)
|
([inputs] #list of raw filenames from `ls /Applications/*.app`, converted to array
	|INDEX(.) #convert to an object indexed (keyed) by filename
	|map_values(.={"__ls":.}) #retain a marker to distinguish as `ls`-sourced
) * . #recursive merge (effectively an SQL JOIN) with the cask index
| .[] | select(."__ls" and length>1) #filter for present files and installable from brw
