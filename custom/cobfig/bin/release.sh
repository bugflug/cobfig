#!/usr/bin/env bash

echo "release > navigating to /tf/..."
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "$SCRIPT_DIR/../../.."
pwd

# START CONFIGURATION
#
MAJOR=0
TYPE="alpha"
#
# END   CONFIGURATION

echo "release > getting latest release tag..."
TAG_NAME=$( \
    curl -H "Accept: application/vnd.github.v3+json" https://api.github.com/repos/hirbird/cobfig/releases/latest \
    | jq -r .tag_name \
    | grep -oE "(\..*\-)" \
)

echo "release > formatting new version and writing..."
MINOR="${TAG_NAME:1:${#TAG_NAME}-2}"
VERSION="$MAJOR.$(($MINOR + 1))-$TYPE"
echo $VERSION > custom/cobfig/bin/version
echo $VERSION

TOKEN=`cat custom/cobfig/bin/token`

custom/cobfig/bin/push.sh

echo "release > resetting release directory..."
rm -rf custom/cobfig/bin/release/*

echo "release > packing vpk..."
custom/cobfig/bin/vpk.sh custom/cobfig
mv custom/cobfig.vpk custom/cobfig/bin/release/cobfig.vpk

echo "release > copying default settings..."
cp -r custom/cobfig/cfg/modules/settings/defaults custom/cobfig/bin/release/cfg

echo "release > creating git release..."
curl \
    -X POST \
    -o custom/cobfig/bin/response \
    -H "Accept: application/vnd.github.v3+json" \
    -H "Authorization: token $TOKEN" \
    -d "{\"tag_name\":\"$VERSION\",\"prerelease\":false}" \
    https://api.github.com/repos/hirbird/cobfig/releases

echo "release > uploading vpk to assets..."
FILE="custom/cobfig/bin/release/cobfig.vpk"
ID=`jq -r .id custom/cobfig/bin/response`
curl \
    -X POST \
    -o custom/cobfig/bin/response \
    --data-binary @"$FILE" \
    -H "Accept: application/vnd.github.v3+json" \
    -H "Authorization: token $TOKEN" \
    -H "Content-Type: $(file -b --mime-type $FILE)" \
    "https://uploads.github.com/repos/hirbird/cobfig/releases/$ID/assets?name=$(basename $FILE)"