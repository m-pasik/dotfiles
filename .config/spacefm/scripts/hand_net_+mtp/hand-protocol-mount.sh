#!/bin/bash

mtpmount="$(which jmtpfs || which simple-mtpfs || which mtpfs || which go-mtpfs)"
if [ -z "$mtpmount" ]; then
    echo "To mount mtp:// you must install jmtpfs, simple-mtpfs, mtpfs, or go-mtpfs,"
    echo "or add a custom protocol handler."
    exit 1
elif [ "${mtpmount##*/}" = "go-mtpfs" ]; then
    # Run go-mtpfs in background, as it does not exit after mount
    outputtmp="$(mktemp --tmpdir spacefm-go-mtpfs-output-XXXXXXXX)" || exit 1
    go-mtpfs "%a" &> "$outputtmp" &
    sleep 2s
    [[ -e "$outputtmp" ]] && cat "$outputtmp" ; rm -f "$outputtmp"
    # set success status only if positive that mountpoint is mountpoint
    mountpoint "%a"
else
    $mtpmount "%a"
fi
