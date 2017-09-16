#!/usr/bin/env bash

#checks compatibility, initializes repo with useful tools, removes self

usage() { printf "init.sh -n <remote-url>\tmake new project and post to remote-url\ninit.sh -j <remote-url>\tjoin existing project at remote-url\n"; }

if [ "$#" -ne 2 ]; then usage; exit 1; fi

while getopts ":n:j:" o; do
	case "${o}" in
		n)
			n=${OPTARG}
			;;
		j)
			j=${OPTARG}
			;;
		*)
			usage
			;;
	esac
done

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

if [ ! -z "$n" ]; then
	#for resetting git commit history
	rm -rf .git
	git init
elif [ ! -z "$j" ]; then
	git clone "$j" temp
	cd temp
fi

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


if [ ! -z "$n" ]; then
	mv post-merge .git/hooks
	
	#remove traces of initialization
	rm init.sh
	rm README.md
	
	#we're done; push to git
	git add .
	git remote add origin "$n"
	git commit -m "$COMMIT_MSG"
	git push -u origin master
elif [ ! -z "$j" ]; then
	mv ../post-merge .git/hooks
	
	git add .
	git commit -m "$COMMIT_MSG"
	git push
	
	#mv temp ..
	#cd ..
	#mv temp ..
	#cd ..
	#rm -rf UnityTemplate
fi
