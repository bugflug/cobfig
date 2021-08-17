#!/usr/bin/env bash

# operate from the tf directory
echo "push > navigating to /tf/..."
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "$SCRIPT_DIR/../../.."

# backup our own custom shit and instead
# copy the default settings into custom for
# end-user purposes
echo "push > moving custom settings and faking the defaults..."
cp -r ./cfg ./cfg_PUSHBACKUP
rm -r ./cfg
cp -r ./custom/cobfig/cfg/modules/settings/defaults ./cfg

# make the commit and push it
echo "push > adding all changed files and cfg files..."
git add -u .
git add ./cfg/*
echo "push > making commit..."
git commit
echo "push > pushing to remote..."
git push

# undo the copying nonsense
echo "push > unfaking defaults and putting custom settings back..."
rm -r ./cfg
mv ./cfg_PUSHBACKUP ./cfg