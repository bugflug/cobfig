#!/usr/bin/env bash

# get the bin directory
echo "vpk > getting vpk bin..."
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
VPK_BIN=$(cd "$SCRIPT_DIR/../../../../bin" && pwd)

# package cobfig into a redistributable vpk
echo "vpk > packing cobfig..."
export LD_LIBRARY_PATH=$(cd "$VPK_BIN" && pwd)
exec "$VPK_BIN/vpk_linux32" "${@}"