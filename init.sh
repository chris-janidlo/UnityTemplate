#!/usr/bin/env bash

#checks compatibility, initializes repo with useful tools, removes self

#from https://docs.unity3d.com/Manual/SmartMerge.html
WIN_YAML_1="C:\Program Files\Unity\Editor\Data\Tools\UnityYAMLMerge.exe"
WIN_YAML_2="C:\Program Files (x86)\Unity\Editor\Data\Tools\UnityYAMLMerge.exe"
MAC_YAML="/Applications/Unity/Unity.app/Contents/Tools/UnityYAMLMerge"
MERGE_CMD="merge -p \"\$BASE\" \"\$REMOTE\" \"\$LOCAL\" \"\$MERGED\""
COMMIT_MSG="Initial commit"

#is git lfs installed?
if ! git lfs install; then
	echo "Install git-lfs (https://git-lfs.github.com/), then run this script again."
	exit 1
fi

#for resetting git commit history
rm -rf .git
git init

echo "Initializing Unity Smart Merge..."
git config --local merge.tool unityyamlmerge
git config --local mergetool.unityyamlmerge.trustExitCode false

if [[ $OSTYPE == darwin* ]]; then
	git config --local mergetool.unityyamlmerge.cmd "$MAC_YAML $MERGE_CMD"
elif [[ $OSTYPE == msys ]]; then
	if [ -f "$WIN_YAML_1" ]; then
		git config --local mergetool.unityyamlmerge.cmd "$WIN_YAML_1 $MERGE_CMD"
	elif [ -f "$WIN_YAML_2" ]; then
		git config --local mergetool.unityyamlmerge.cmd "$WIN_YAML_2 $MERGE_CMD"
	fi
fi

echo "Adding post-merge hook..."
mkdir -p .git/hooks/
mv post-merge .git/hooks

#remove self
rm init.sh

#we're done; push to git
if [ "$#" -eq 1 ]; then
	git remote add origin "$1"
	git commit -m "$COMMIT_MSG"
	git push -u origin master
else
	git commit -m "$COMMIT_MSG"
	git push
fi
