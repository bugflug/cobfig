#!/usr/bin/env bash

# operate from the cobfig directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "$SCRIPT_DIR/.."

# move the custom files into the settings defaults
echo ""
echo "copying cfg/custom to modules/settings/defaults:"
cp -r ./cfg/custom/* ./cfg/modules/settings/defaults

echo ""
echo "ignored:"
git check-ignore **/*

# make the commit and push it
echo ""
echo "adding all changed files:"
git add -u .
echo ""
echo "making commit:"
git commit
echo ""
echo "pushing to remote:"
git push