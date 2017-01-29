#!/bin/bash

# usage basejit-cli.sh myProjectName MyExportedName

if [ "$#" -ne 2 ]
then
	echo "usage: basejit-cli.sh myProjectName MyExportedName"
	exit 1
fi

BASEJIT_GITHUB_URL=https://github.com/haxpor/basejit/archive/master.zip
BASEJIT_BASE=basejit
PROJ_NAME=$1
EXPORTED_NAME=$2

# download latest source files only of basejit from github
curl -L -o $BASEJIT_BASE.zip $BASEJIT_GITHUB_URL

# unzip
unzip $BASEJIT_BASE.zip

# clean up
mv $BASEJIT_BASE-master/** ./
mv $BASEJIT_BASE-master/.[!.]* ./
rm $BASEJIT_BASE.zip

# remove un-zipped folder
rmdir $BASEJIT_BASE-master

# change basejit text in all source file to the specified from command line
find ./src -type f -name "*.js" -exec sed -i '' "s/basejit/$PROJ_NAME/g" {} +
find ./src -type f -name "*.js" -exec sed -i '' "s/Basejit/$EXPORTED_NAME/g" {} +
find ./test -type f -name "*.js" -exec sed -i '' "s/basejit/$PROJ_NAME/g" {} +
find ./test -type f -name "*.js" -exec sed -i '' "s/Basejit/$EXPORTED_NAME/g" {} +
find ./gulpfile.js -exec sed -i '' "s/basejit/$PROJ_NAME/g" {} +
find ./gulpfile.js -exec sed -i '' "s/Basejit/$EXPORTED_NAME/g" {} +
find ./package.json -exec sed -i '' "s/basejit/$PROJ_NAME/g" {} +

# replace content of README.md file
echo "# $PROJ_NAME 
<project description here>

# Misc
This project is based on [https://github.com/haxpor/basejit](https://github.com/haxpor/basejit)" > README.md

# rename file with basejit.js to $PROJ_NAME.js
mv ./src/$BASEJIT_BASE.js ./src/$PROJ_NAME.js

# prepare project via NPM
npm install