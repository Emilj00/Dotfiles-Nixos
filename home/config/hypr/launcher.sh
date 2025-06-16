#!/usr/bin/env bash

BEMENU_TAG="bemenu"

if pgrep -f "$BEMENU_TAG" > /dev/null; then
    pkill -f "$BEMENU_TAG"
else
    bash -ic '
        compgen -c | sort -u | BEMENU_SCALE=1.8 bemenu \
        --tb "#d8a657" --tf "#1d2021" --fb "#1d2021" --ff "#d8a657" \
        --nb "#1d2021" --nf "#d8a657" --hb "#161819" --hf "#ff0000" \
        --fbb "#1d2021" --fbf "#d8a657" --sb "#1d2021" --sf "#d8a657" \
        --ab "#1d2021" --af "#d8a657" --scb "#1d2021" --scf "#d8a657" \
        --prompt "Run: " \
        --fn "monospace-12" \
        --title "$BEMENU_TAG" | xargs -r setsid nohup >/dev/null 2>&1
    ' &
fi
