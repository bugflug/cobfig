#!/usr/bin/env bash

# operate from the cobfig directory
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
cd "$SCRIPT_DIR/.."

# backup our own custom shit and instead
# copy the default settings into custom for
# end-user purposes
echo ""
echo "moving custom settings and faking the defaults:"
cp -r ./cfg/custom ./cfg/custom-bak
cp -r ./cfg/modules/settings/default/* ./cfg/custom

echo ""
echo "ignored:"
git check-ignore **/*

# make the commit and push it
echo ""
echo "adding all changed files:"
git add -u .
git add ./cfg/custom/*
echo ""
echo "making commit:"
git commit
echo ""
echo "pushing to remote:"
git push

# undo the copying nonsense
echo ""
echo "unfaking defaults and putting custom settings back:"
rm -r ./cfg/custom
mv ./cfg/custom-bak ./cfg/custom